defmodule Lexicon do
    def main(args) do
        args |> parse_args |> process |> cleanup
    end

    # Parse arguments into a keyword list
    def parse_args(args) do
        baseURL = "http://api.pearson.com/v2/dictionaries/entries"
        options = %{ :define => "define" }
        
        cmd_opts = OptionParser.parse(
            args,
            switches: [define: :string],
            aliases: [d: :define]
        )
        
        case cmd_opts do
           {[:define], _} -> # Search here 
        end
    end
end