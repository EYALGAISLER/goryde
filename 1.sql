USE [EYALGI]
GO

/****** Object:  Table [businessinmo].[gordye_ticket_groups]    Script Date: 29/06/2021 12:41:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [businessinmo].[gordye_ticket_groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nchar](100) NULL,
 CONSTRAINT [PK_gordye_ticket_groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

