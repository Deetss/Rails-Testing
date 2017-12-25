# Rails Testing

## This is a the code, and work for [Rails 5 Test Prescriptions](https://pragprog.com/book/nrtest3/rails-5-test-prescriptions).

## Notes:

- Use the TDD process to create and adjust your code's design in small, incremental steps.
- In a test-driven process, if it is difficult to write tests for a feature, strongly consider the possibility that the design of the underlying code needs to be changed
- Initializing objects is a good starting place for a TDD process. Another good approach is to use the test to design what you want a successful interaction of the feature to look like.
- When possible, write your tests to describe your code's behavior, not its implementation.
- Keeping your code as simple as possible allows you to focus complexity on the areas that really need complexity.
- Choose your test data and test-variable names to make it easy to diagnose failures when they happen. Meaningful names and data that doesn't overlap are helpful.
- Using Capybara allows you to simulate user activity for endto-end tests of your Rails features
- I like placing business logic outside Rails classes. It makes that logic easier to test and manage.
- Use :aggregate_failures to get the best features of single-assertion and multiple-assertion tests
- Your tests are also code. Specifically, your tests are code that does not have tests.
- Think about both the short-term and long-term cost of tests as you write them.
- TDD Metaprocess: ![alt-text](https://imgur.com/NoDqEc6.png "TDD Process")
- If you find yourself writing tests that already pass given the current state of the code, that often means you're writing too much code in each pass.
- Refactoring is where a lot of design happens in TDD, and it's easiest to do in sall steps. Skip it at your peril.
- Try to extract methods when you see compound Booleans, local variables, or inline comments.
- Expectations that cover different branches of the application logic should be handled in separate specs
- Fixtures are particularly useful for global semi-static data stored in the database.
- Your go-to build strategy for factory_bot should be build_stubbed unless there is a need for the object to be in the database during the test.
- Avoid defining associations automatically in factory_bot definitions. Set them test by test, as needed. You'll wind up with more manageable test data.
- Use partial doubles when you want to ensure most of your real object behavior. Use full doubles when the behavior of the stubbed object doesn't matter--only its public interface does.
