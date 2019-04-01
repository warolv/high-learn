# Highlearn - school system for managing course grades.

## Description
  * The system allows other systems to create and modify Students, Teachers, Courses and Grades
  * The system provides statistical calculations over this data.
  * The communication with the system is RESTful over HTTP.

## Entity Relationship Diagram of highlearn 
 ![alt text](images/erd.png "Highlearn ERD")

## Implemented API
  Used one level routing to simplify CRUD operation on models (not used nested routes like /course/1/grades)
 
  * GET    /api/v1/students     Get all students
  * GET    /api/v1/students/1   Get specific student        
  * POST   /api/v1/students     Create student
  * PUT    /api/v1//students/1  Update student
  * DELETE /api/v1//students/1  Delete student
  * GET    /api/v1/students/highest_average_in_courses  The student with the highest average in courses 

  * GET    /api/v1/teachers     Get all teacher              
  * GET    /api/v1/teachers/1   Get specific teacher         
  * POST   /api/v1/teachers     Create teacher
  * PUT    /api/v1//teachers/1  Update Teacher
  * DELETE /api/v1//teachers/1  Delete Teacher
  * GET    /api/v1/teachers/max_students  The teacher with the max number of students.

  * GET    /api/v1/courses      Get all courses              
  * GET    /api/v1/courses/1    Get specific course         
  * POST   /api/v1/courses      Create course
  * PUT    /api/v1//courses/1   Update course
  * DELETE /api/v1//courses/1   Delete course
  * GET    /api/v1/easiest      Get the easiest course (the one with the highest average of grades)

  * GET    /api/v1/grades       Get all grades              
  * GET    /api/v1/grades/1     Get specific grade         
  * POST   /api/v1/grades       Create grade
  * PUT    /api/v1//grades/1    Update grade
  * DELETE /api/v1//grades/1    Delete grade

### Things to empasize
  To not duplicate data between teacher and student - I used (STI) Single Table Inheritance, meaning teacher and student models
  both using user table and differintiated by 'type' field
  Same for API endpoints of teacher / students - both using users controller

### Things that has been left out and need improvement
  * Did minimal test coverage for main functionality - Unit Tests / Request Tests (API)
  * For Calculated fields I am using SQL queries for each request, need improvement - add table with calculates fields for this actions and every time grade/course/teacher/student added/changed/removed update this table via model callbacks, also we may cache this table to get results faster

### Token based authentication using doorkeeper via oauth token

  Demo token: "Authorization: Bearer 695810e253c27ab86838315855b05dd4a084007bc76c5a3cfb3a6a5b68be19e4"
  Testing with curl: curl -H 'Accept: application/json' -H "Authorization: Bearer 695810e253c27ab86838315855b05dd4a084007bc76c5a3cfb3a6a5b68be19e4" http://localhost:5555/api/v1/students

### Installing and running
  * https://github.com/warolv/high-learn.git
  * docker-compose build
  * docker-compose up -d
  * docker-compose run web bundle install
  * docker-compose run web bundle exec rake db:create - Create DB
  * docker-compose run web bundle exec rake db:migrate - Run Migrations
  * docker-compose run web bundle exec rake db:seed - Seed DB with some data (teacher/students/grades/courses)

## Running the tests

* docker-compose run web bundle exec rspec

## Built With

Ruby on Rails 5 API version

## Authors

* **Igor Zhivilo** - [warolv.net](https://warolv.net)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
