BackChannel-Application
=======================

An application using Ruby on Rails having similar functionality to Quora

CSC 517
Project 1

Back-channel Application in Ruby on Rails

Team
-----
1) Apeksha Saxena – asaxena2
2) Sundeep Kota – skota3
3) Omkar Dalvi - okdalvi

Extra Credit features
----------------------
1) Used Twitter BootStrap for UI
2) Used RSpec test framework

Features added since the last review
-------------------------------------
1) Implemented Super Admin user functionality : He can do anything(read/edit/delete object models) on the back-channel application
2) Updated Admin user functionality : He can add/delete user,posts,categories. He can also make users as admins, but he can't revoke Admin rights for a user.
3) Implemented Search functionality : We provide a single search box on the home page, and also provide an entry in navigation bar to go to the search page. The user can search for posts based on the post title, content, tag, user name and category title. Also a user can search for posts without signing in to the application. The posts will be visible to him, but he will not be able to modify any of them.
4) Implemented Voting on comments functionality. Also number of votes are visible next to the comments and posts.
5) Refined and used consistent UI throughout the application.
6) Multiple RSpec tests added.
7) Anonymous User posts functionality : When a user is deleted then all the posts that he made in the application are shown as Anonymous user posts (earlier these posts where deleted along with the user because of dependency destroy feature of rails).

Limitations
-----------
** Implemented all the features as per the requirement specifications document for the project.

Link to the application : http://152.7.99.91:3000

Super Admin User credentials:
Email: superadmin@liveforum.com
Password: foobar

Admin User credentials:
Email: adminuser@liveforum.com
Password: foobar

List of commands to be executed to run the RSpec tests:
-------------------------------------------------------
1) rake db:reset
2) rake db:test:prepare
3) bundle exec rspec spec/models/<each rspec test file name goes here>

List of commands to be executed before running the application:
---------------------------------------------------------------
1) bundle install
2) rake db:migrate
3) rake db:populate
4) rails s

References:
-----------
http://guides.rubyonrails.org/getting_started.html

Note:
-----
This site is best viewable in Google Chrome Web Browser.
