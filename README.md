# Timesheets

This is a prototype version of timesheets app which is a part of assignment for course CS5610 as Northeastern Unviersity.

## Design Choices

* On the site load up, the server checks if the request contains any cookies. If not, then it shows the user a login page, through which they can sign in to their account. If a cookie is found, server will check whether the user is a worker or a manager and accordingly, they will be redirected to their respective page.

### For worker:
* The home page consists of the timesheets that are previously submitted by the user. They are shown brief details about their timesheet. It contains date and status of the timesheet. To see the complete details of the timesheet, user can click on the 'show timesheet' link.

* The timesheet consist of columns for date, worker_id and distinct fields for job code and hours for the eight rows of the form.
   1. User can select the date from the date-picker that is available when filling out timesheer.
   2. worker_id is automatically fethed on the submission of timesheet.
   3. Remaining field will be fetched from the user input.
      * If the job code is "None" then the hour dedicated to it will be nullified because it is not a valid job code.
      * If the total hours of work done in timesheet is 0, then the timesheet wont be submitted, because it will indicate that worker did not work on that day.
      * If the total hours of work done is greater than 9, then the timesheet wont be submitted.
      * Hours can be set in the increment of 0.1 which can ensure accurate tracking of time that a worker worked.
      * Job code selection is populated with job codes by a query to db.
      * A gaurd has been implemented to prevent creation of two timesheets for the same day for a user to ensure that there is no ambiguity in the timesheet for a given date.
   4. Upon submission, user will be shown the submitted timesheet.
   5. Routes for timesheets are gaurded to allow only worker and managers to view the timesheet.
   6. Routes for timesheet: new, create, update, show
   7. Timesheet has many to one relation with user.
* Routes for worker: new, show, create, delete

### For manager:
* The home page consists of the workers under the current manager. Manager can view any worker under them and view their timesheets. Then, only manager is given the access to approve the timesheet of a user. This gaurd is implemented on the frontend as well as backend.
* Only a manager can create a worker. So, whenever a manager creates a worker, that manager is automatically assigned to the worker. There is one to many relationship between manager and workers.
* The manager can create a job. Doing so will assign that job to the currently logged in manager.
   - Routes for job: index, new, create
* The manager can delete a worker in order to revoke their access to the timesheet system.
* A signup page is provided for testing purpose. It will only create a manager on signup.
* Routes for manager: new, show, create

## Seeds for test

#### Worker
* email: jon@doe.com, password: helloworld

#### Manager
* email: alice@example.com, password: helloworld

