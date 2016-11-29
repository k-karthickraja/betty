#Roadmap
-------
    1. Add the basic implementation of brief.
    2. Integrate the DayTask ( Todo.txt ) to list/update the task.

#Services
--------

* Agent  ( Can be reusable with crontab )
  - It should run always, (daemon)
  - should have the configuration to be execute periodically.
  - Verify the servers assesiblity.
  - Verify the backup status.
  - Verify the service status.

* Mailer
  - To be send/receive mails.
  - Read mails form PPM, add those events to my daily plan.

* Proactive
  - Send the mail for health check. [ DONE ]

* Alert
  - Should have the mechanism to alert me when any thing wrong.
      - Desktop Alert mechanism. ( May a chance that I might missed to see )
      - Email notification.
      - SMS ( If it has threatened )

  - Need to check the Disk space of myself, if it above threshold alert me.

* Events.
  - Should read the ICS type of calender.
  - Capable to create and edit the events in the calender.
  - Reminders have been.

* DayBook
  - Integration with daybook repo.
  - Should have the capability to search on my daybook.
    o by current month , year .
    o by available xoxes.

  - Keep track of my xox status, updated/uploaded/Yet to prepare. [ LATER ]
    o if not add it into my morning brief.

* DayPlanner
  - Check for the due date in weekly and monthly plans, if any add it into todays plan.
  - Add the task into calender for today.
  - When marking a job done , Sync the same with calender.

* Brief
  - Brief the today's todo , Events , Any Alerts etc....
  - Days for the projects to be complete. ( Need to find the mechanism for this.)

* Snap
  - To Take a snap of given project repo, by appending the timestamp. 
  - Extract the project files. 
  - Add the security 
