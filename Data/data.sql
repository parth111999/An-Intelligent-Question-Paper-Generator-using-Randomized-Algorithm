USE [master]
GO
/****** Object:  Database [Question]    Script Date: 06-03-2019 18:40:04 ******/
CREATE DATABASE [Question]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Question', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Question.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Question_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Question_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Question] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Question].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Question] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Question] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Question] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Question] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Question] SET ARITHABORT OFF 
GO
ALTER DATABASE [Question] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Question] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Question] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Question] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Question] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Question] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Question] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Question] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Question] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Question] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Question] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Question] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Question] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Question] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Question] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Question] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Question] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Question] SET RECOVERY FULL 
GO
ALTER DATABASE [Question] SET  MULTI_USER 
GO
ALTER DATABASE [Question] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Question] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Question] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Question] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Question] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Question', N'ON'
GO
USE [Question]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 06-03-2019 18:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[courseid] [int] NOT NULL,
	[coursename] [varchar](50) NULL,
	[subject] [varchar](50) NULL,
	[teacherid] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exami]    Script Date: 06-03-2019 18:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exami](
	[ID] [varchar](50) NULL,
	[Pass] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcq]    Script Date: 06-03-2019 18:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq](
	[mcq_id] [int] NULL,
	[question] [varchar](max) NULL,
	[option1] [varchar](max) NULL,
	[option2] [varchar](max) NULL,
	[option3] [varchar](max) NULL,
	[option4] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLog]    Script Date: 06-03-2019 18:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QLog](
	[QId] [varchar](50) NULL,
	[Course] [varchar](50) NULL,
	[Subject] [varchar](50) NULL,
	[QName] [varchar](50) NULL,
	[QCode] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ques]    Script Date: 06-03-2019 18:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ques](
	[QId] [varchar](50) NULL,
	[TId] [varchar](50) NULL,
	[Ques] [varchar](max) NULL,
	[Course] [varchar](50) NULL,
	[Subject] [varchar](50) NULL,
	[Section] [int] NULL,
	[Difficulty] [varchar](50) NULL,
	[marks] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teach]    Script Date: 06-03-2019 18:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Teach](
	[TId] [varchar](50) NULL,
	[TName] [varchar](50) NULL,
	[TPass] [varchar](50) NULL,
	[TMobile] [varchar](50) NULL,
	[TEmail] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Course] ([courseid], [coursename], [subject], [teacherid]) VALUES (101, N'SY_CE_8', N'Advance DataBase', 1)
INSERT [dbo].[Course] ([courseid], [coursename], [subject], [teacherid]) VALUES (101, N'SY_CE_8', N'Software Engineering', 2)
INSERT [dbo].[Course] ([courseid], [coursename], [subject], [teacherid]) VALUES (102, N'SY_EE_8', N'Logic Diagram', 1)
INSERT [dbo].[Exami] ([ID], [Pass]) VALUES (N'1', N'admin')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (101, N'The different classes of relations created by the technique for preventing modification anomalies are called?', N'normal forms.', N'referential integrity constraints.', N'functional dependencies.', N'None of the above is correct.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (102, N'A relation is in this form if it is in BCNF and has no multivalued dependencies?', N'second normal form', N'third normal form.', N'fourth normal form.', N'domain/key normal form.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (103, N'Row is synonymous with the term?', N'record', N'relation', N'column', N'field')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (104, N'The primary key is selected from the:', N'composite keys.', N'determinants.', N'candidate keys.', N'foreign keys.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (105, N'Which of the following is a group of one or more attributes that uniquely identifies a row?', N'Key', N'Determinant', N'Tuple', N'Relation')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (106, N'When the values in one or more attributes being used as a foreign key must exist in another set of one or more attributes in another table, we have created a(n)?', N'transitive dependency.', N'insertion anomaly.', N'referential integrity constraint.', N'normal form.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (107, N'A relation is considered a?', N'Column', N'one-dimensional table.', N'two-dimensional table.', N'three-dimensional table.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (108, N'In the relational model, relationships between relations or tables are created by using?', N'composite keys.', N'determinants.', N'candidate keys.', N'foreign keys.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (109, N'	 A functional dependency is a relationship between or among?', N'tables', N'rows', N'relations', N'attributes')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (110, N'Table is synonymous with the term?', N'record', N'relation', N'column', N'field')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (111, N'Which of the following is not a restriction for a table to be a relation?', N'The cells of the table must contain a single value.', N'All of the entries in any column must be of the same kind.', N'The columns must be ordered.', N'No two rows in a table may be identical.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (112, N'For some relations, changing the data can have undesirable consequences called?', N'referential integrity constraints.', N'modification anomalies.', N'normal forms.', N'transitive dependencies.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (113, N'	 A key?', N'must always be composed of two or more columns', N'can only be one column.', N'identifies a row.', N'identifies a column.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (114, N'An attribute is a(n):', N'column of a table.', N'two dimensional table.', N'row of a table.', N'key of a table.')
INSERT [dbo].[mcq] ([mcq_id], [question], [option1], [option2], [option3], [option4]) VALUES (115, N'	 A relation in this form is free of all modification anomalies?', N'First normal form', N'Second normal form', N'Third normal form', N'domain/key normal form.')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'101', N'SY_CE_8', N'Advance DataBase', N'admin', N'1234', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'102', N'SY_CE_8', N'Software Engineering', N'admin', N'5678', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'104', N'SY_CE_8', N'Advance DataBase', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'105', N'SY_CE_8', N'Advance DataBase', N'doc', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'106', N'SY_CE_8', N'Advance DataBase', N'doc', N'2', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'109', N'SY_CE_8', N'Advance DataBase', N'admin', N'0', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'112', N'SY_CE_8', N'Advance DataBase', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'107', N'SY_CE_8', N'Advance DataBase', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'108', N'SY_CE_8', N'Advance DataBase', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'110', N'SY_CE_8', N'Advance DataBase', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[QLog] ([QId], [Course], [Subject], [QName], [QCode], [Date]) VALUES (N'111', N'SY_CE_8', N'Software Engineering', N'admin', N'1', N'2019-03-01')
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1002', N'1', N'Give difference between Extended ROWID and Restricted ROWID?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1003', N'1', N'Define hot and cold backup?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1005', N'1', N'List various methods used for storing data in Oracle?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1006', N'1', N'Write Syntax to create new table?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1007', N'1', N'Segregate database technology''s development?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1010', N'1', N'Define DDL and DML?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1011', N'1', N'Why is group-clause used?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1012', N'1', N'What restrictions can you apply when you are creating views?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1013', N'1', N'Define Join and enlist its types.', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1014', N'1', N'How does Index hunting help in improving query performance?', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1016', N'1', N'What do you mean by Fill Factor concept with respect to indexes?', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1017', N'1', N'Differentiate Nested Loop, Hash Join and Merge Join.', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1018', N'1', N'What do you mean by Query Evaluation Engine?', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1019', N'1', N'Describe different type of failures in Oracle Environment?', N'101', N'Advance DataBase', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1022', N'1', N'How will you differentiate between VARCHAR & VARCHAR2?', N'101', N'Advance DataBase', 1, N'Medium', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1023', N'1', N'What is the difference between SUBSTR & INSTR functions?', N'101', N'Advance DataBase', 1, N'Hard', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1024', N'1', N'How can we find out the duplicate values in an Oracle table?', N'101', N'Advance DataBase', 1, N'Hard', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1025', N'1', N'Explain different components of RMAN?', N'101', N'Advance DataBase', 1, N'Easy', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1027', N'1', N'Explain create new tablespace , rename tablespace, change the size of tablespace and alse write sql query for following tablespace?', N'101', N'Advance DataBase', 1, N'Easy', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1028', N'1', N'Eplain different type of indexs? Hoe to Reorganize and drop the index?', N'101', N'Advance DataBase', 1, N'Easy', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1029', N'1', N'How TRANSLATE command is different from REPLACE?', N'101', N'Advance DataBase', 1, N'Medium', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1031', N'1', N'What is the quickest way to fetch the data from a table?', N'101', N'Advance DataBase', 1, N'Medium', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1032', N'1', N'Where do we use DECODE and CASE Statements?', N'101', N'Advance DataBase', 1, N'Medium', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1033', N'1', N'What do you mean by MERGE in Oracle and how can we merge two tables?', N'101', N'Advance DataBase', 1, N'Hard', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1034', N'1', N'What are the set operators UNION, UNION ALL, MINUS & INTERSECT meant to do?', N'101', N'Advance DataBase', 1, N'Hard', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1001', N'1', N'List any four features of RMAN?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1021', N'1', N'How will you identify Oracle Database Software Release?', N'101', N'Advance DataBase', 1, N'Medium', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1030', N'1', N'Why do we use COALESCE function in Oracle?', N'101', N'Advance DataBase', 1, N'Medium', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1035', N'1', N'What is a View and how is it different from a table?', N'101', N'Advance DataBase', 1, N'Hard', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1036', N'1', N'What is a Role in Oracle database?', N'101', N'Advance DataBase', 1, N'Hard', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1004', N'1', N'State the use of System pre-defined tablespace and Undo Pre-defined tablespace?', N'101', N'Advance DataBase', 1, N'Easy', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1008', N'1', N'What are the features of Database language?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1009', N'1', N'Define Normalization?', N'101', N'Advance DataBase', 1, N'Medium', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1015', N'1', N'What is Executive Plan?', N'101', N'Advance DataBase', 1, N'Hard', 2)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1020', N'1', N'Explain Different Backup and Recovery Strategy?', N'101', N'Advance DataBase', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1026', N'1', N'Explain Open and Closed Backup?', N'101', N'Advance DataBase', 1, N'Easy', 6)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1037', N'2', N'Describe MOI Model of team leadership?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1038', N'2', N'Write down the task involved in CMMI level 2', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1041', N'2', N'Define the term task pattern?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1043', N'2', N'List Down the activities involved in umbrella activities?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1048', N'2', N'State SQA Activities?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1050', N'2', N'what is good test and successfull test?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1052', N'2', N'Describe risk refinement?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1055', N'2', N'Explain any 2 principles of project scheduling?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1056', N'2', N'Differentiate between Cardinality and Modality?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1058', N'2', N'Describe layered technology approach of software engineering?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1061', N'2', N'Explain reactive and proactive risk strategoies?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1062', N'2', N'Compare black box and white box testing concept?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1064', N'2', N'Explain Software reliability?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1065', N'2', N'Compare alpha and beta testing?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1067', N'2', N'What are major seven task of requirement engineering? Explain any two in detail?', N'101', N'Software Engineering', 1, N'Easy', 8)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1068', N'2', N'Explain recovery testing, security testing and stress testing?', N'101', N'Software Engineering', 1, N'Easy', 8)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1039', N'2', N'Define the term software scope?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1045', N'2', N'List down any three core principles of software engineering?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1049', N'2', N'Explain software risk?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1053', N'2', N'Explain criteria for completion of testing?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1060', N'2', N'Explain relationship between people and effort?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1040', N'2', N'List down any three principles of deployment?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1046', N'2', N'Explain risk Identification?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1044', N'2', N'Describe any three designing modelling process?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1047', N'2', N'Differentiate between verification and validation?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1051', N'2', N'Explain six sigma for software engineering?', N'101', N'Software Engineering', 1, N'Easy', 3)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1054', N'2', N'Explain Data Attribute and Modularity?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1057', N'2', N'Describe task network of project management?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1059', N'2', N'Write down the objectives of the analysis modelling?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1063', N'2', N'Describe ISO 9000 quality standard?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1066', N'2', N'Explain the product spectrum and process spectrum?', N'101', N'Software Engineering', 1, N'Easy', 8)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1069', N'2', N'Explain cocomo model', N'101', N'Software Engineering', 1, N'Easy', 8)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1070', N'2', N'State The testing principles', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Ques] ([QId], [TId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks]) VALUES (N'1071', N'2', N'Explain RMMM strategy?', N'101', N'Software Engineering', 1, N'Easy', 4)
INSERT [dbo].[Teach] ([TId], [TName], [TPass], [TMobile], [TEmail]) VALUES (N'1', N'Swami', N'1234', N'9134356778', N'swami@gmail.com')
INSERT [dbo].[Teach] ([TId], [TName], [TPass], [TMobile], [TEmail]) VALUES (N'2', N'Akash', N'1234', N'9134356778', N'akash@gmail.com')
INSERT [dbo].[Teach] ([TId], [TName], [TPass], [TMobile], [TEmail]) VALUES (N'3', N'admin', N'1234', N'9134356778', N'admin@gmail.com')
USE [master]
GO
ALTER DATABASE [Question] SET  READ_WRITE 
GO
