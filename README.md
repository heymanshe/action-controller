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