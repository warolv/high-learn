# Highlearn - school system for managing course grades.

## Description
  * The system allows other systems to create and modify Students, Teachers, Courses and Grades
  * The system provides statistical calculations over this data.
  * The communication with the system is RESTful over HTTP.

## Implemented API
  Used one level routing to simplify CRUD operation on models (not used nested routes like /course/1/grades)
  
  * GET    /api/v1/students     Get all students
  * GET    /api/v1/students/1   Get specific student        
  * POST   /api/v1/students     Create student
  * PUT    /api/v1//students/1  Update student
  * DELETE /api/v1//students/1  Delete student


  * GET    /api/v1/teachers     Get all teacher              
  * GET    /api/v1/teachers/1   Get specific teacher         
  * POST   /api/v1/teachers     Create teacher
  * PUT    /api/v1//teachers/1  Update Teacher
  * DELETE /api/v1//teachers/1  Delete Teacher


  * GET    /api/v1/courses      Get all courses              
  * GET    /api/v1/courses/1    Get specific course         
  * POST   /api/v1/courses      Create course
  * PUT    /api/v1//courses/1   Update course
  * DELETE /api/v1//courses/1   Delete course


  * GET    /api/v1/grades       Get all grades              
  * GET    /api/v1/grades/1     Get specific grade         
  * POST   /api/v1/grades       Create grade
  * PUT    /api/v1//grades/1    Update grade
  * DELETE /api/v1//grades/1    Delete grade


### Things that has been left out and need improvement
  Did minimal test coverage for main functionality - Unit Tests / Request Tests (API)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

* Installed ruby envinronment - 2.3.1 version
* Installed MySQL2

### Database setup


### Token based authentication using doorkeeper via oauth token

  Demo token: "Authorization: Bearer 695810e253c27ab86838315855b05dd4a084007bc76c5a3cfb3a6a5b68be19e4"

### Installing and running
  * git clone https://github.com/warolv/high-learn.git
  * cd high-learn
  * bundle install
  * rake db:migrate
  * rails s -p 5555

## Running the tests

bundle exec rspec

## Built With

Ruby on Rails 5 API version

## Authors

* **Igor Zhivilo** - [warolv.net](https://warolv.net)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


