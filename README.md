# Lexicon

**CLI built in Elixir that returns word definitions**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `lexicon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:lexicon, "~> 0.1.0"}]
    end
    ```

  2. Ensure `lexicon` is started before your application:

    ```elixir
    def application do
      [applications: [:lexicon]]
    end
    ```

## Usage
To use Lexicon, install and run with the following:
  ```
  ./Lexicon --define {word to define}
  *OR*
  ./Lexicon -d {word to define}
  ```
You can currently only grab word definitions but I plan to add flags for getting the parts of speech a word is used in and sentence examples in the near future.   