module Twitter
  module Streaming
    class Response
      def on_body(data)
        @tokenizer.extract(data).each do |line|
          next if line.empty?
          @block.call(JSON.parse(line, :symbolize_names => true)) rescue next
        end
      end
    end
  end
end