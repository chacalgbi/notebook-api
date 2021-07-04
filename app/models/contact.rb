class Contact < ApplicationRecord
   belongs_to :kind #, optional: true

   # def author
   #    "Thomé Lucas A. Oliveira"
   # end

   # def as_json(options={})
   #    super(
   #       methods: :author,
   #       root: true,
   #       include: {kind: {only: :description}},
   #       except: :kind_id
   #    )
   # end
   
end
