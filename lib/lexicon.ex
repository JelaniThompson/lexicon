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

    def return_definition(baseURL) do
        HTTPotion.get(baseURL)
        |> Map.get(:body)
        |> Poison.decode
        |> case do {_, response} -> response end
        |> case do {_, results} -> results end
        |> Map.fetch("results")
        |> List.first |> Map.fetch("senses") |> case do {:ok, senses} -> senses end 
        |> List.first |> Map.fetch("translations") |> case do {_, translations} -> translations end 
        |> List.first |> Map.fetch("example") |> case do {_, example} -> example end |> List.first 
        |> Map.fetch("text") |> IO.inspect
    end
end