# Project Setup

## Prerequisites

1. Ensure you have Ruby version 3.3.0 installed. You can check your Ruby version by running `ruby -v` in your terminal. If you don't have Ruby installed, you can follow the instructions [here](https://www.ruby-lang.org/en/documentation/installation/).

2. This project uses Bundler for managing Ruby dependencies. If you don't have Bundler installed, you can install it by running `gem install bundler`.

## Setup

1. Clone the repository to your local machine using `git clone https://github.com/rodrigolj/marvel-secret-wars.git`.

2. Navigate to the project directory using `cd marvel-secret-wars`.

3. Run `bundle install` to install the Ruby dependencies.

4. This project uses the Marvel API, so you will need to obtain your own API keys. You can do this by signing up on the [Marvel Developer Portal](https://developer.marvel.com/).

5. Once you have your Marvel API keys, you need to set them in the Rails configuration. Run `rails credentials:edit` in your terminal. This will open the credentials file in your default text editor. Add your Marvel API keys in the following format:

    ```yaml
    marvel:
      public_key: <your_public_key>
      private_key: <your_private_key>
    ```

    Replace `<your_public_key>` and `<your_private_key>` with your actual Marvel API keys. Save and close the file.

6. Run `rails server` to start the Rails server.

7. Open your browser and navigate to `http://localhost:3000`. You should see the Marvel Secret Wars homepage.