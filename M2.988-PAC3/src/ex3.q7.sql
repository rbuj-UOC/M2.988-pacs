CREATE TABLE [dbo].[DIM_airlines](
    [pk_airline] [int] NOT NULL,
    [name] [nvarchar](100) NULL,
    [iata] [nvarchar](5) NULL,
    [icao] [nvarchar](5) NULL,
    [callsign] [nvarchar](100) NULL,
    [country] [nvarchar](50) NULL,
    [active] [bit] NULL,
    PRIMARY KEY CLUSTERED([pk_airline] ASC)
)
GO
CREATE TABLE [dbo].[DIM_airports](
        [pk_airport] [int] NOT NULL,
        [name] [nvarchar](100) NULL,
        [city] [nchar](50) NULL,
        [country] [nchar](50) NULL,
        [iata] [nvarchar](5) NULL,
        [icao] [nvarchar](5) NULL,
        [latitude] [float] NULL,
        [longitude] [float] NULL,
        [altitude] [int] NULL,
        [timezone] [nvarchar](50) NULL,
        [tz] [nvarchar](50) NULL,
        PRIMARY KEY CLUSTERED([pk_airport] ASC)
    )
GO
CREATE TABLE [dbo].[DIM_planes](
        [pk_plane] [int] NOT NULL,
        [name] [nvarchar](100) NULL,
        [iata] [nvarchar](3) NULL,
        [icao] [nvarchar](4) NULL,
        PRIMARY KEY CLUSTERED([pk_plane] ASC)
    )
GO
CREATE TABLE [dbo].[FACT_routes](
        [pk_route] [int] NOT NULL,
        [fk_airline] [int] NOT NULL,
        [fk_source_airport] [int] NOT NULL,
        [fk_destination_airport] [int] NOT NULL,
        [fk_plane] [int] NOT NULL,
        [stops] [int] NULL,
        [icao] [nvarchar](4) NULL,
        PRIMARY KEY CLUSTERED([pk_route] ASC)
    )
GO
ALTER TABLE [dbo].[FACT_routes] WITH CHECK
ADD CONSTRAINT [FK_FACT_routes_DIM_airlines] FOREIGN KEY([fk_airline]) REFERENCES [dbo].[DIM_airlines] ([pk_airline])
GO
ALTER TABLE [dbo].[FACT_routes] WITH CHECK
ADD CONSTRAINT [FK_FACT_routes_DIM_airports_s] FOREIGN KEY([fk_source_airport]) REFERENCES [dbo].[DIM_airports] ([pk_airport])
GO
ALTER TABLE [dbo].[FACT_routes] WITH CHECK
ADD CONSTRAINT [FK_FACT_routes_DIM_airports_d] FOREIGN KEY([fk_destination_airport]) REFERENCES [dbo].[DIM_airports] ([pk_airport])
GO
ALTER TABLE [dbo].[FACT_routes] WITH CHECK
ADD CONSTRAINT [FK_FACT_routes_DIM_planes] FOREIGN KEY([fk_plane]) REFERENCES [dbo].[DIM_planes] ([pk_plane])
GO