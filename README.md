# Gradebook

Gradebook creates a simple grading system for a school. It allows for the recording and reporting of courses offered by teachers and taken by students Teachers, students, and administrators can login to see data relevant to their role.
* A Teacher can manage his course roster.
* A Teacher can view the enrolled students and their grades for a given course.
* A Student can see the courses he is registered for (with grades).
* A Student can see his GPA for a given semester.
* An Administrator can view enrollment counts across all courses for a semester.
* An Administrator can view an average grade for a given course.

## Getting Started

1. Clone this repository.

  ```shell
  git clone git@github.com:lilwillifo/gradebook.git
  ```
2. Change into the `gradebook` directory.

3. Bundle:
  `$ bundle`

4. Set up the database:
  `$ rake db:create`
  `$ rake db:migrate`
  `$ rake db:seed`

5. Start up your rails server with `rails s` and open localhost:3000 in your browser. Check out seeds.rb to find logins. Try teacher1 (password: test), student1 (password: test), and Admin (password: test) to get a sense of roles. 

6. Run test suite (unit and feature tests)

  ```shell
  rspec
  ```

### Prerequisites

You'll need [Rails](https://rubyonrails.org/) and [Ruby](https://www.python.org/downloads/) installed. This is written in Ruby 2.3.6. I recommend using [rbenv](http://rbenv.org/) to manage ruby versions.

## Contributing

Please follow the Getting Started guide to set up your local dev environment.

This guide assumes that the git remote name of the main repo is `upstream` and that your fork is named `origin`.

Create a new branch on your local machine to make your changes against (based on `upstream/master`):

    git checkout -b branch-name-here --no-track upstream/master

Make sure the tests pass on your new branch:

    `rspec`

### Making a change

Make your changes to the codebase. I recommend using TDD. Add a test, make changes and get the test suite back to green.

    `rspec`

Once the tests are passing you can commit your changes. See [How to Write a Good Commit Message](https://chris.beams.io/posts/git-commit/) for more tips.

    git add .
    git commit -m "Add a concise commit message describing your change here"

Push your changes to a branch on your fork:

    git push origin branch-name-here
### Submitting a Pull Request

Use the GitHub UI to submit a new pull request against upstream/master. Please have a look at this guide to [making a great pull request](https://www.atlassian.com/blog/git/written-unwritten-guide-pull-requests)

TL;DR:
* Write tests
* Make sure the whole test suite is passing
* Keep your PR small, with a single focus
* Maintain a clean commit history
* Use a style consistent with the rest of the codebase
* Before submitting, [rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) on the current master branch
## Built With

* [Rails](https://rubyonrails.org/)
* [Rspec](http://rspec.info/)
* [factorybot](https://github.com/thoughtbot/factory_bot)
* [shoulda matchers](https://github.com/thoughtbot/shoulda-matchers)
* [capybara](https://github.com/teamcapybara/capybara)



## Authors

* **Margaret Williford**

## Future Iterations
Currently, anyone can create an account and they are automatically registered as a student. This is to not allow individuals to sign up as an admin or teacher without permission. Currently, I'd have to change role manually on the backend. Ideally an admin would have these permissions to make changes. 

This is also an exercise in database design, TDD, and Object Oriented Design. The intention was not to focus on views and layouts so it is currently extremely bare bones. 

I'd like to add assigments to courses, so each courses grade was the average of all assignment grades. 
