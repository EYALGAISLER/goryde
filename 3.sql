USE [EYALGI]
GO

/****** Object:  Table [businessinmo].[gordye_tickets]    Script Date: 29/06/2021 12:41:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [businessinmo].[gordye_tickets](
	[ticket_id] [bigint] NULL,
	[ticket_subject] [varchar](85) NULL,
	[ticket_content] [varchar](286) NULL,
	[ticket_priority] [bigint] NULL,
	[ticket_group_id] [bigint] NULL,
	[user_full_name] [varchar](29) NULL,
	[user_email] [varchar](34) NULL,
	[ticket_status] [bigint] NULL,
	[ticket_date] [datetime] NULL
) ON [PRIMARY]

GO

