class Member < ActiveRecord::Base
	filterrific :default_filter_params => { :sorted_by => 'number_asc' },
		:available_filters => %w[
				sorted_by 
				search_query
			]
	
	self.per_page = 30

	has_many :assignments
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
    num_or_conditions = 2
		where(
     terms.map {
        or_clauses = [
          "members.number LIKE ?",
          "LOWER(members.email) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

	scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^number_/
      order("LOWER(members.number) #{ direction }, LOWER(members.email) #{ direction }")
    when /^email_/
      order("LOWER(members.email) #{ direction }, LOWER(members.number) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
	
	def self.options_for_select
		order('number').map { |e| [e.*] }
	end
		
	def self.options_for_sorted_by
		[
			['Medlemsnr', 'number_asc'],
			['Email', 'email_asc']
		]
	end

end
