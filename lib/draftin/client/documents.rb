module Draftin
  class Client
    module Documents
      
      def all_documents(options={})
        get("/documents.json", options)
      end
      
    end
  end
end