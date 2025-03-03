# 1. Action Controller in Rails

- Action Controller is the C in the MVC (Model-View-Controller) pattern.

- It processes incoming requests and generates appropriate responses.

## In a typical RESTful application:

- The controller receives the request.

- It interacts with the model to fetch or save data.

- It passes data to the view for rendering.

# 2. Controller Naming Conventions

## General Naming Rules

- **Plural form** is preferred for controller names (e.g., `ClientsController` instead of `ClientController`).

- `ApplicationController` is an exception to the pluralization rule.

- Using plural names allows Rails' route generators (e.g., `resources`) to work without extra configurations.

- Controllers follow a different naming convention than models:

  - **Controllers**: Plural (e.g., `OrdersController`)

  - **Models**: Singular (e.g., `Order`)

## Controller Actions

- Actions (methods) should be **public**, as only public methods can be called as actions.

- **Helper methods** (not intended as actions) should have **private** or **protected** visibility.

## Reserved Method Names

- Some method names are reserved by `ActionController`.

- Redefining reserved methods may cause `SystemStackError`.

- Following `RESTful Resource Routing` prevents conflicts.

- If a reserved name must be used, a `custom route` should map it to a different method.

# 3. Parameters 

- Data sent by incoming requests is available in the params hash.

- Two types of parameter data:

  - Query String Parameters: Sent as part of the URL (e.g., http://example.com/accounts?filter=free).

  - POST Parameters: Submitted from an HTML form.

- Rails treats both types the same and makes them available in the params hash.

```ruby
class ClientsController < ApplicationController
  # Handles query string parameters from GET request
  def index
    if params[:status] == "activated"
      @clients = Client.activated
    else
      @clients = Client.inactivated
    end
  end

  # Handles form parameters from a POST request
  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client
    else
      render "new"
    end
  end
end
```

## ActionController::Parameters

- `params` is not a regular Ruby Hash, but an instance of `ActionController::Parameters`.

- Keys can be accessed using both symbols and strings interchangeably.

- Provides methods for filtering and security.

## 3.1 Hash and Array Parameters

### Sending Arrays in Parameters

- To send an array, append [] to the key name.

```bash
GET /users?ids[]=1&ids[]=2&ids[]=3
```

- Encoded URL: `/users?ids%5b%5d=1&ids%5b%5d=2&ids%5b%5d=3`

- `params[:ids]` will be `['1', '2', '3']` (all values are strings).

### Sending Hashes in Parameters

- Nested parameters can be sent using bracket notation:

```html
<form action="/users" method="post">
  <input type="text" name="user[name]" value="Acme" />
  <input type="text" name="user[phone]" value="12345" />
  <input type="text" name="user[address][postcode]" value="12345" />
  <input type="text" name="user[address][city]" value="Carrot City" />
</form>
```

- `params[:user]` will be:

```bash
{
  "name" => "Acme",
  "phone" => "12345",
  "address" => {
    "postcode" => "12345",
    "city" => "Carrot City"
  }
}
```

### Security Considerations

- Values such as `[nil]` or `[nil, nil, ...]` in params are replaced with `[]` for security reasons.



