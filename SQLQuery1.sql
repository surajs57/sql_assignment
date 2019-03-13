USE [test]
GO

/****** Object:  Table [dbo].[branch]    Script Date: 13-03-2019 12:11:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[branch](
	[branch_id] [varchar](15) NOT NULL,
	[branch_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[branch_detail](
	[usn] [varchar](15) NULL,
	[branch_id] [varchar](15) NULL,
	[college_id] [varchar](20) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[branch_detail]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO

ALTER TABLE [dbo].[branch_detail]  WITH CHECK ADD FOREIGN KEY([college_id])
REFERENCES [dbo].[college] ([college_id])
GO

ALTER TABLE [dbo].[branch_detail]  WITH CHECK ADD FOREIGN KEY([usn])
REFERENCES [dbo].[student_details] ([usn])
GO
CREATE TABLE [dbo].[college](
	[college_id] [varchar](20) NOT NULL,
	[college_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[college_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
                 
CREATE TABLE [dbo].[college_details](
	[usn] [varchar](15) NULL,
	[college_id] [varchar](20) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[college_details]  WITH CHECK ADD FOREIGN KEY([college_id])
REFERENCES [dbo].[college] ([college_id])
GO

ALTER TABLE [dbo].[college_details]  WITH CHECK ADD FOREIGN KEY([usn])
REFERENCES [dbo].[student_details] ([usn])
GO
CREATE TABLE [dbo].[records](
	[usn] [varchar](15) NULL,
	[subject_id] [varchar](15) NULL,
	[attendance] [int] NULL,
	[Internal_assesment1] [int] NULL,
	[Internal_assesment2] [int] NULL,
	[Internal_assesment3] [int] NULL,
	[final_assesment] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[records]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO

ALTER TABLE [dbo].[records]  WITH CHECK ADD FOREIGN KEY([usn])
REFERENCES [dbo].[student_details] ([usn])
GO
CREATE TABLE [dbo].[student_details](
	[usn] [varchar](15) NOT NULL,
	[first_name] [varchar](10) NULL,
	[last_name] [varchar](10) NULL,
	[batch] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[subject_details](
	[branch_id] [varchar](15) NULL,
	[subject_id] [varchar](15) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[subject_details]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO

ALTER TABLE [dbo].[subject_details]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
CREATE TABLE [dbo].[subjects](
	[subject_id] [varchar](15) NOT NULL,
	[subject_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
