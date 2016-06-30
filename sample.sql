INSERT INTO resourceinfo values(NULL, "Class Dojo", "www.classdojo.com","Free!", "Plan"
, "Classroom Management", NULL, "someimage.png","Classroom management tool used for tracking behavior, attendance, and parent communication.");

INSERT INTO subjectinfo values((select resourceInfoID from resourceInfo where resourceInfoID = 1),'3', "Teacher Device Only","ELA");

INSERT INTO rating values((select resourceInfoID from resourceinfo where resourceInfoID = 1), 4, 16, 4);

INSERT INTO teachercomments VALUES((select resourceInfoID from resourceinfo where resourceInfoID = 1), "My students' behaviour improved dramatically when I started using CD!" , "Jenn", "3rd", "");
INSERT INTO teachercomments VALUES((select resourceInfoID from resourceinfo where resourceInfoID = 1), "This was a good thing." , "Adam","5th", "Science");

INSERT INTO resourceinfo values(NULL, "GoNoodle", "www.gonoodle.com","Free!", "Reflect"
, "Collaboration", NULL ,"someimage.png","Classroom management tool used to deliver whole-class brain breaks, including exercise and meditation follow along videos and interactive games.");

INSERT INTO subjectinfo values((select resourceInfoID from resourceInfo where resourceInfoID = 2), '6', "Teacher Device and Display","ELA");

INSERT INTO rating values((select resourceInfoID from resourceinfo where resourceInfoID = 2),3.7, 12, 3);


INSERT INTO teachercomments VALUES((select resourceInfoID from resourceinfo where resourceInfoID = 2), "My class loves to prep for tests with AirTime!", "Shelton", "6th", "Science");
INSERT INTO teachercomments VALUES((select resourceInfoID from resourceinfo where resourceInfoID = 2), "Buggy, do not use!", "Hailey", "7th", "PE");






/*
use this to display the info...Use 1 or whatever the id for the resource is...

SELECT nameOfSite, linkToSite, altImageUrl, description, comment, teacherName, teacherGrade, teacherSubject, 
teachingEnvironment, pricingModel, rating FROM resourceinfo, subjectinfo, rating, teachercomments WHERE
resourceInfoID = 1 AND ratingID = 1 AND subjectInfoID = 1 AND teacherCommentsID = 1;
*/