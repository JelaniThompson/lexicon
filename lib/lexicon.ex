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
        opts[:define]
    end

    def get_definition(definition) do
        "http://api.pearson.com/v2/dictionaries/entries?headword=" <> definition
    end

    # Return the word definition
    def return_definition(baseURL) do
        HTTPotion.get(baseURL)
        |> Map.get(:body) |> Poison.decode |> case do {_, response} -> response end
        |> Map.fetch("results") |> case do {_, results} -> results end |> List.first
        |> Map.fetch("senses") |> case do {:ok, senses} -> senses end |> List.first
        |> Map.fetch("definition") |> case do {_, definition} -> definition end 
        |> IO.inspect(label: "Definition:")
    end
end