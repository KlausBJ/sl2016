class Member < ActiveRecord::Base
	filterrific :default_filter_params => { :sorted_by => 'number asc' },
							:available_filters => %w[
								sorted_by 
								search_query
			]
	
	self.per_page = 35

	has_many :registrations
	
	scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.to_s.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
		terms = terms.map { |e|
			'%' + (e.gsub('*', '%') + '%').gsub(/%+/, '%')
		}
		# configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
		where(
     terms.map {
        or_clauses = [
          "members.number LIKE ?",
          "LOWER(members.email) LIKE ?",
					"LOWER(members.name) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }
# sort_option bliver ikke brugt...
	scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name/
      order("LOWER(members.name) #{ direction }")
    when /^number/
      order("members.number #{ direction }")
    when /^email/
      order("LOWER(members.email) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
	
	def self.options_for_sorted_by
		[
			['Medlemsnr', 'number_asc'],
			['Email', 'email_asc'],
			['Navn', 'name_asc']
		]
	end
	
	def decorated_number
		number.to_i
	end

end
