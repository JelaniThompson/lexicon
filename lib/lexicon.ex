defmodule Lexicon do
    def main(args) do
        args 
        |> parse_args 
        |> get_definition 
        |> return_definition
        # add process and cleanup later
    end

    # Parse command line arguments into a keyword list
    def parse_args(args) do        
        {opts, _, _} = OptionParser.parse(
            args,
            switches: [define: :string],
            aliases: [d: :define]
        )
        definition = opts[:define]
        # IO.inspect(definition)
    end

    def get_definition(definition) do
        baseURL = "http://api.pearson.com/v2/dictionaries/entries?headword=" <> definition
    end

    def return_definition(baseURL) do
        word = HTTPotion.get(baseURL)
        # IO.puts(response.results.senses.definition)
        IO.puts(word.body)
    end
end