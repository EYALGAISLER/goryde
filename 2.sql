USE [EYALGI]
GO

/****** Object:  Table [businessinmo].[gordye_ticket_priority]    Script Date: 29/06/2021 12:41:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [businessinmo].[gordye_ticket_priority](
	[ticket_priority_id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_priority_name] [nchar](100) NULL
) ON [PRIMARY]

GO

