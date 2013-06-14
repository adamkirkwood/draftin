module Draftin
  class Client
    module Documents
      
      def all_documents(options={})
        get("documents", options)
      end
      
      def document(id, options={})
        get("documents/#{id}", options)
      end
      
    end
  end
end