## Instructions

### Short Answer
Answer with something like 1–4 sentences. We aren't looking for a precise technical definition. Answer in a way that you think is relevant to your software engineering work. If you don't know an answer, don't copy/paste from the web - just give whatever info you know.

- **What is HTML?**<br>
HTML stands for Hyper Text Markup Language and creates the primary structure of any webpage and the Dom.  HTML uses opening and closing tags (ie. "p", "div", "span", etc.) to delinate where different page elements begin and end.  Each tag has some inherent properties, but in modern web pages the most common tag is a "div".  Tags can also be nested to create any layout, limited only by imagination.
- **What is CSS?**<br>
CSS stands for Cascading Sheet Style and gives instructions for how each element on a page should look via the use of id's or classes assigned to HTML elements.  There are an incredible number of CSS properties that you can use to make a page look how you want, for example fonts, font-sizing, coloring of anything, shadows, layering via z-index, borders, intructions for how elements should react to different screen-sizes, widths, heights, opacity, and on and on.  If I were to try to describe all the available CSS properties here, it would take many pages...
- **What is the DOM?**<br>
DOM stands for Document Object Model and is essential the base data structure of a web-page. It would be best described as a tree data structure where each HTML element makes up an individual node in that tree.
- **What is TCP/IP?**<br>
TCP/IP stands for Transmission Control Protocol/Internet Protocol and is the primary data transfer protocol that allows the modern internet to function.
- **What is memory?**<br>
Memory most frequently refers to RAM (random access memory), which is a type of volatile data storage that can hold data for as long as it is powered.  The benefit of using RAM over something like hard disk storage is that it is extremely fast to address, read and write to, far faster than any kind of longterm storage, like a hard drive or SSD.  Virtually all software uses a combination of RAM and storage for execution.  The downside of RAM is that the moment a computer is turned off, everything in memory is lost, so it does not make a good form of longterm storage.  However, it is perfect for use during software execution.
- **In a programming language, what is a class?**<br>
Classes exist in object-oriented programming languages, and they define the functionality and scope of objects.  Classes can inherit from other classes to help keep codebases as D.R.Y. as possible. Classes can be intialized as many times as needed, called an "instance".  Instances can be passed data to be stored in instance varables, and that data can be read and manipulated during execution.  Classes also typically have instance and class methods. Instance methods are called on instances of the class to perform some functionality defined within the class.  Class methods are for functionality that is defined on the entire class itself.  There are also more advanced forms of classes, such as Singleton or Eigenclasses, but that is probably beyond the scope of the question.
- **In a database, what is a foreign key?**<br>
Foreign keys are the fundamental concept that allow relational/SQL databases to have relationships between tables.  It is probably easiest to describe with an example.  Let's say there is a Users and Posts table, and we want Users to have access to as many Posts as they want to create. Both the User and Posts table would have an "id" column to give each row a unique identifier.  Additionally, the Posts table would have a "user_id" column which would serve as the foreign key storing the unique "id" of the user that created that post.  In Rails, the User model would ```have_many: posts```, and the Posts model would ```belong_to: user```, allowing the User to easily access any post they created in the application. By simple calling ```User.find(:id).posts``` Rails returns all posts created by the user represented by the `:id`.
- **What is Model View Controller?**<br>
Model View Controller or MVC is the design pattern utilized by Rails and describes the flow of data within the application.  Models are classes that contain variables that map to database table columns (ie. Users with name and address) Models contain logic related to what that model can do in the application, for example, data validations and permissions could be managed in a model.  Views contain data presentation logic, forms, links, buttons, etc. and are what the user actually sees on their screen. Views are selected by a controller based on the routing configuration.  The views can render HTML directly, or if the controller is for an API, the controller may render JSON instead of a view, to be parsed and displayed by the front-end, usually asynchronously. Views are how users interact with the applications and submit data.<br><br>
The Controller contains all the logic for each action requested by the user.  Rails controllers default to RESTful routing that uses 7 fundamental actions (index, new, create, edit, update, show, destroy), which allow the user to perform the most important actions of web applications.  Sometimes it is useful to create custom Controller actions and routes, but much of the time you can get away with just those 7 defaults. Any instance variables created in a Rails controller, perhaps by accessing model data, are automatically passed into a view.
 
### Coding
For these challenges, you may write any code you wish in order to implement your answer. Please provide code in a runable file, with some instructions in comments at the top for how to run it.

### Prime Number Finder
Write a function that looks for prime numbers for a certain amount of time. When that amount of time has elapsed, it prints the largest prime number it found, and then returns nil. invoked like this to run for 5 seconds: find_prime_number(5)

### Class design
Create classes Cat, Dog, Chicken, CatFood, DogFood, HumanFood, Lemons

- a cat likes CatFood, Chicken, and Milk
- a dog likes DogFood, CatFood, Chicken, HumanFood
- a Cat can meow and a Dog can bark (print "meow" or "bark" to STDOUT)
- when an animal eats food it likes, it makes a noise three times
- when an animal eats food it dislikes, it makes a noise one time
- You can implement this any way you like, with whatever api you think makes sense.


#### Include a driver file which requires the files, instantiates the classes, and invokes the methods to demonstrate the functionality.
- **How to run:**
  - Unzip file, open terminal, `cd` into the `healthie_tech_screen` directory
  - If ruby is installed on the machine, just type `ruby main.rb` and everything will execute

### Details:
#### Animal and food classes:
- I created parent `Animal` and `Food` classes that each animal and food class inherits from.
- Animals take an options hash to override default values.
- I noticed that neither the cat nor the dog like lemons, so I throw and catch an error when you feed them one.
- I also created a `Raccoon` class to show how easily extensible the animal class is. They only like HumanFood, as is true for all trash pandas. Also, raccoons have no dislikes because of course they don't. However, they also don't know what lemons are.
- Upon execution, all of the foods are tried by all of the animals, printing what each is trying and how many noises they make, as well as an error message when you feed anything a lemon.

#### Prime Number finder:
- I opted to use a class for the prime number finder, so I could better encapsulate logic. It uses two methods for finding primes, one uses the built in Ruby 'prime' library and the other is a more brute force approach. I thought it would interesting to compare the library against my prime algorithm.
- I included as many little optimizations as I could think of (ie. the fact that all primes after 2 and 3 are in the form of 6n+1 or 6n-1, only needing to check the first 1/3 of factors instead of all factors 1 up to n, etc.)
- The fast approach appears to run in O(n) time, while my brute force approach is O(n^2), which becomes more obvious the longer you set it to run, in terms of how far they each get.
- I execute it twice, once for 5 seconds and print the largest prime like the instructions say, and then once for 5 milliseconds. I added an option to print an array of all the primes found if `true` is passed to the `PrimeFinder#new` method as a second argument, so that you can see that it works correctly. I chose 5ms for printing the primes list in order to avoid blowing up the terminal with tens of thousands of primes. Also, just delete the `true` passed to `new` if you want ignore the list of primes. Printing all primes defaults as `false`.
- The `PrimeFinder` is invoked with a `runtime` value in seconds (or decimal fractions) and an optional boolean, ie.
  - `PrimeNumberFinder.new(5)` - prints largest and total number of primes found in 5secs
  - `PrimeNumberFinder.new(0.005, true)` - same as above, also prints the array of all primes found in 5ms
 
### Database and model design with queries
We want to model providers (e.g. dietitians), their clients, and journal entries.

- Both providers and clients have a name and an email address.
- Providers have many clients
- Clients usually have one Provider but can have more than one.
- Clients have a plan that they paid for, signified by the string "basic" or "premium". For each provider that a client is signed up with, they have 1 plan.
- Clients post journal entries. These consist of freeform text.

### Model and relationship design
#### Model Schema:
- **Providers** ```name: string, email_address: string, id: integer```
- **Clients** ```name: string, email_address: string, id: integer```
- **Plans** (join table) ```provider_id: integer, client_id: integer, tier: string``` `"basic"` or `"premium"`
- **JournalEntries** ```content: text, client_id: integer```
- **Note: `uuid` is also an option instead of integer ids, and an `enum` could be used in place of a `string` for plan `tier`**

#### Relationships:
- The following model code will establish all the necessary relationships, and along with the schema describled above, relationships will connect models as described per the app description.
```Ruby 
class Clients < ApplicationRecord
  has_many :plans
  has_many :providers, through: :plans
  has_many :journal_entries, dependent: :destroy # delete any user journal entries if user they belong to is ever deleted
end

class Providers < ApplicationRecord
  has_many :plans
  has_many :clients, through: :plans
end

class Plans < ApplicationRecord
  belongs_to :client
  belongs_to :provider
end

class JournalEntries < ApplicationRecord
  belongs_to :client
end
```

#### We want to be able to do these queries:
```Ruby
# Find all clients for a particular provider: 
@clients = Provider.find(params[:id]).clients 

# Find all providers for a particular client: 
@providers = Client.find(params[:id]).providers

# Find all of a particular client's journal entries, sorted by date posted:
@entries = Client.find(params[:id]).journal_entries.order(created_at: :desc) # recent first, ':asc' for oldest first

# Find all of the journal entries of all of the clients of a particular provider, sorted by date posted: 
@entries = Provider.find(params[:id]).clients.includes(:journal_entries).order(created_at: :desc).map {|client| client.journal_entries } # recent first, ':asc' for oldest first
```

#### Instructions with terminal commands for creating and scaffolding a new *diet-app*
- `rails new diet-app`
- `cd diet-app`
- `rails g scaffold Provider name:string email_address:string`
- `rails g scaffold Client name:string email_address:string`
- `rails g scaffold JournalEntry content:text client:references`
- `rails g scaffold Plan tier:string client:references provider:references`
- ** Note: The scaffold generators added indexes on all the foreigh keys.  Indexes are an optimization to always keep in mind for speeding up some queries.  However, do not add indexes on everything, only `ids` or columns that are regularly used as a lookup for models that are read frequently.  You don't want to use indexes on columns that are regularly written to in the database.  While indexes can make lookups faster, they can also make writing to the database slower.  Use them judiciously.  In general, it is easiest to add indexes before you make a new model migration, but you can add indexes at any time via a new migration.
- Copy the following code over everything in the `db/seeds.rb` file.
  - **Note:** The seed file creates 3 clients, 3 providers, 6 plans, 12 journal entries, and makes sure every model created has all necessary relationships.  Always feel free to edit the seeds or create your own, but we need at least some data to make sure everything is working.
```Ruby
client_names = %w[alice bob charles]
provider_names = %w[dan ed fran]
lorem_ipsum = %w[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum]

clients = client_names.map do |name| # make 3 clients
  Client.create({name: name.capitalize, email_address: "#{name}@fake_client.com"})
end

providers = provider_names.map do |name| #make 3 providers
  Provider.create({name: name.capitalize, email_address: "#{name}@fake_provider.com"})
end

clients.each.with_index(3) do |client, i| #make journal entries minimum of 3 per client
  i.times { JournalEntry.create({ content: lorem_ipsum.sample(20).join(' '), client: client }) }
end

providers.each_with_index do |provider, i| # create relationship between clients/providers
  # 1st provider has 3 plans/clientx, 2nd has 2 plans/clients, 3rd has 1 plans/client
  # 1st client has have 1 plan/provider, 2nd has 2 plans/providers, 3rd has 3 plans/providers
  tier = %w[basic premium].sample
  i.upto(2) { |j| Plan.create({provider: provider, client: clients[j], tier: tier}) }
end
```
-  Run `rails db:create db:migrate db:seed`
- **Optional:** Create nested **routing** in `config/routes.rb` file if you want to play around with nested routes. However, I recommend using the default routing created for you at least at first for getting basic functionality working, and then go for experimentation with the routes.
- Add `root to: <controller>#<action>` in the `routes.rb` file for whatever you want the app's base URL/`localhost:3000` to display, as well as setting the `root_path` and `root_url` helper methods.  I set mine to the client index.
- This is what your `config/routes.rb` file should look like after you run all the generators and add a `root` path
```Ruby
Rails.application.routes.draw do
  resources :plans
  resources :journal_entries
  resources :clients
  resources :providers
 
  root "clients#index" # or whatever you want the root/home action to be
end
```
- **Note:** If you do use the nested routing instead of the defaults provided by the generators, it may create some routes that have duplicate calls to some controller actions.  Without knowing how we want the application to look/function for the user types at first, it might be difficult to decide which routeesto use and which to prune this early on the app development.  I think it's easiest to stick with default routing for awhile (When in doubt, follow the KISS principle, otherwise Murphy may getcha.)
- Add the following relationship code to the respective models 
  - **Note:** The `belongs_to:` relationship code is different here than what I listed above, because passing the gerators a `references` argument will have added them to the `JournalEntries` and `Provider` models, since those are the two models that have foreign keys on their schemas.
```Ruby 
class Clients < ApplicationRecord
  has_many :providers, through: :plans
  has_many :journal_entries
end

class Providers < ApplicationRecord
  has_many :clients, through: :plans
end
```
- Copy the custom queries into the controller actions where you want to use them.  I thought it was appropriate to put them in `providers#show` and `clients#show`, but you may have a different preference for how you want to use them.
  - **Note:** (Again, if you change the default routing, params permitting, how you access ids from the params hash may need to be be updated if you used nested routing, since different routes/controllers send/receive params differently. For example, in some cases with nested routes, `clients` will have its `:id` available via `params[:id]`, but with other routes/controllers `params[:client_id]` may be how it is accessed). 
  - I the fundamental logic/format of the queries is sound, you just may need to update how you access the `:id` that is passed in the params hash if you change the routing.
  - **I found that the fastest way to show that all the queries are working, is to put everything called on the Providers class in `providers#show`, so queries 1 and 4, where we have access to the `provider` `:id` exactly how it is written below.
  - Same thing goes for `clients#show` for queries 2 and 3.
```Ruby 
@clients = Provider.find(params[:id]).clients # Find all clients for a particular provider, put in providers#show
@providers = Client.find(params[:id]).providers # Find all providers for a particular client
# Find all of a particular client's journal entries, sorted by date posted, put in clients#show
@entries = Client.find(params[:id]).journal_entries.order(created_at: :desc) # recent first, ':asc' for oldest first
# Find all of the journal entries of all of the clients of a particular provider, sorted by date posted, put in clients#show
@entries = Provider.find(params[:id]).clients.includes(:journal_entries).order(created_at: :desc).map {|client| client.journal_entries } # recent first, ':asc' for oldest first, put in providers#show
```
- you can use the generated `set_<model>` methods to find the appropriate model instance, if you do, the queries will look like:
```Ruby
# In the Clinet controller, under the #show action in my case
@providers = set_client.providers
@entries = set_client.journal_entries.order(created_at: :desc)
# In the Providers controller, under the #show action in my case
@clients = set_provider.clients 
@entries = set_provider.clients.includes(:journal_entries).order(created_at: :desc).map { |client| client.journal_entries }
```
- **Note:** At the command line, use `rails routes` at anytime to see a list of all routes and associated actions, path/url methods,  and the form of the `id` params for any controllers/actions, `rails routes` is always a useful reference.
- Now you should be ready to type `rails s` to run the server on your local machine, if you haven't already.
- Navigate to `localhost:3000` in a browser, and you should see the new application running.

- **Note:** These instructions will get the app up and running with more of 99% of the necessary code created by the generators and/or pasted from this readme file. However, some views may need to be adjusted depending on how you want to display data, and which actions/views you decide to use want to use most. 
- There are always multiple ways to accomplish your preferred functionality with Rails.  
- I chose to primarily use `providers#index`, `providers#show`, `clients#index`, and `clients#show` to display the data I created in the seed file or with forms, and I added links to be able to switch back and forth between those two indexes as well as adding other convenience links.

#### Final Note:
I tried to write this last part of this readme for how to get the Rails app running as if I was instructing someone new how to create this app from scratch.  Please don't take it this document as if I don't think you guys know how to do everything here, either same or better.  I wanted to show how I generally write documentation.  I try to be as detailed as possible, and I like to think I have gotten pretty good at creating solid documentation.
