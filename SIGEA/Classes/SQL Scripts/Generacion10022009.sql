USE [SIGEA]
GO
/****** Objeto:  User [SistemaSIGEA]    Fecha de la secuencia de comandos: 02/10/2009 21:14:01 ******/
CREATE USER [SistemaSIGEA] FOR LOGIN [SistemaSIGEA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Objeto:  Table [dbo].[TipoServicio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[idTipoServicio] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_tipoServicio] PRIMARY KEY CLUSTERED 
(
	[idTipoServicio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Carrera]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[idCarrera] [smallint] NOT NULL,
	[nombreCarrera] [nvarchar](40) NOT NULL,
	[posgrado] [bit] NOT NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoMaterial]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMaterial](
	[idTipoMaterial] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoMaterial] PRIMARY KEY CLUSTERED 
(
	[idTipoMaterial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaseInmueble](
	[idClase] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
	[vidaUtil] [int] NULL,
 CONSTRAINT [PK_ClaseInmueble] PRIMARY KEY CLUSTERED 
(
	[idClase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoFormacionProfesional]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoFormacionProfesional](
	[idTipoFormacion] [smallint] NOT NULL,
	[nombreFormacion] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TipoFormacionProfesional] PRIMARY KEY CLUSTERED 
(
	[idTipoFormacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoEstadoConservacion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEstadoConservacion](
	[idTipoEstadoConservacion] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoEstadoConservacion] PRIMARY KEY CLUSTERED 
(
	[idTipoEstadoConservacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoDocumentoValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoValuador](
	[idTipoDocumento] [smallint] NOT NULL,
	[nombreTipoDocumento] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoDocumentoValuador] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Carpeta]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carpeta](
	[idCarpeta] [smallint] IDENTITY(1,1) NOT NULL,
	[ruta] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Carpeta] PRIMARY KEY CLUSTERED 
(
	[idCarpeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoOrientacion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoOrientacion](
	[idTipoOrientacion] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoOrientacion] PRIMARY KEY CLUSTERED 
(
	[idTipoOrientacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoColindancia]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoColindancia](
	[idTipoColindancia] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoColindancia] PRIMARY KEY CLUSTERED 
(
	[idTipoColindancia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoTopografia]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTopografia](
	[idTipoTopografia] [smallint] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TipoTopografia] PRIMARY KEY CLUSTERED 
(
	[idTipoTopografia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoUbicacion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUbicacion](
	[idTipoUbicacion] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoUbicacion] PRIMARY KEY CLUSTERED 
(
	[idTipoUbicacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Estado]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[claveEstado] [int] NOT NULL,
	[nombreEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[claveEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoUnidad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUnidad](
	[idTipoUnidad] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoUnidad] PRIMARY KEY CLUSTERED 
(
	[idTipoUnidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoAsentamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAsentamiento](
	[idTipoAsentamiento] [smallint] NOT NULL,
	[tipoAsentamiento] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoAsentamiento] PRIMARY KEY CLUSTERED 
(
	[idTipoAsentamiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoUsoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsoConstruccion](
	[idTipoUsoConstruccion] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoUsoConstruccion] PRIMARY KEY CLUSTERED 
(
	[idTipoUsoConstruccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoCalidadProyecto]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCalidadProyecto](
	[idTipoCalidadProyecto] [smallint] NOT NULL,
	[descricion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoCalidadProyecto] PRIMARY KEY CLUSTERED 
(
	[idTipoCalidadProyecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  UserDefinedFunction [dbo].[FormatearIDE]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FormatearIDE] 
(
	@consecutivo int,
	@mes smallint,
	@periodo smallint
)
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @IDE nvarchar(20)
	SET @IDE = 'VGPO-' 
		+ right('00000' + convert(nvarchar, @consecutivo), 5) 
		+ '-' 
		+ right('00' + convert(nvarchar(2), @mes), 2)
		+ '-'
		+ right('0000' + convert(nvarchar(4), @periodo), 4)
	
	RETURN @IDE 
END
GO
/****** Objeto:  Table [dbo].[TipoFuente]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoFuente](
	[idTipoFuente] [smallint] NOT NULL,
	[descripcion] [nvarchar](40) NOT NULL,
	[condominio] [bit] NOT NULL,
 CONSTRAINT [PK_TipoFuente] PRIMARY KEY CLUSTERED 
(
	[idTipoFuente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[GeneracionIDE]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneracionIDE](
	[consecutivo] [int] NOT NULL,
	[periodo] [smallint] NOT NULL,
	[ultimaGeneracion] [datetime] NOT NULL,
 CONSTRAINT [PK_GeneracionIDE] PRIMARY KEY CLUSTERED 
(
	[consecutivo] ASC,
	[periodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoCaracteristicaPanoramica]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCaracteristicaPanoramica](
	[idTipoCaracteristica] [smallint] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCaracteristicaPanoramica] PRIMARY KEY CLUSTERED 
(
	[idTipoCaracteristica] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValuador](
	[idTipoValuador] [smallint] NOT NULL,
	[descripcion] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_TipoValuador] PRIMARY KEY CLUSTERED 
(
	[idTipoValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoInmueble](
	[idTipoInmueble] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoInmueble] PRIMARY KEY CLUSTERED 
(
	[idTipoInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoServidumbre]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServidumbre](
	[idTipoServidumbre] [smallint] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoServidumbre] PRIMARY KEY CLUSTERED 
(
	[idTipoServidumbre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[StatusAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusAvaluo](
	[idStatus] [smallint] NOT NULL,
	[descripcion] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_StatusAvaluo] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoImportanciaVialidad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoImportanciaVialidad](
	[idImportanciaVialidad] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoImportanciaVialidad] PRIMARY KEY CLUSTERED 
(
	[idImportanciaVialidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RegimenPropiedad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegimenPropiedad](
	[idRegimenPropiedad] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_RegimenPropiedad] PRIMARY KEY CLUSTERED 
(
	[idRegimenPropiedad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RolSistema]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolSistema](
	[idRol] [smallint] IDENTITY(1,1) NOT NULL,
	[nombreRol] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_RolSistema] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[PropositoAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropositoAvaluo](
	[idProposito] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_PropositoAvaluoInmobiliario] PRIMARY KEY CLUSTERED 
(
	[idProposito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoCredito]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCredito](
	[idTipoCredito] [smallint] NOT NULL,
	[decripcion] [nvarchar](35) NOT NULL,
	[tieneCofinanciamiento] [bit] NOT NULL CONSTRAINT [DF_TipoCredito_tieneCofinanciamiento]  DEFAULT ((0)),
 CONSTRAINT [PK_TipoCredito] PRIMARY KEY CLUSTERED 
(
	[idTipoCredito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoAcabado]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAcabado](
	[idTipoAcabado] [smallint] NOT NULL,
	[nombreAcabado] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TipoAcabado] PRIMARY KEY CLUSTERED 
(
	[idTipoAcabado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoAvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAvaluoInmobiliario](
	[idSubTipo] [smallint] NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoAvaluoInmobiliario] PRIMARY KEY CLUSTERED 
(
	[idSubTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Banco]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banco](
	[idBanco] [smallint] NOT NULL,
	[nombreBanco] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED 
(
	[idBanco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Usuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaUltimaSesion] [datetime] NOT NULL CONSTRAINT [DF_Usuario_fechaUltimaSesion]  DEFAULT (getdate()),
	[email] [nvarchar](50) NOT NULL,
	[online] [bit] NOT NULL CONSTRAINT [DF_Usuario_online]  DEFAULT ((0)),
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[GeneracionFolioSHF]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneracionFolioSHF](
	[consecutivo] [int] NOT NULL,
	[periodo] [smallint] NOT NULL,
	[ultimaGeneracion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_GeneracionFolioSHF] PRIMARY KEY CLUSTERED 
(
	[consecutivo] ASC,
	[periodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoContacto]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoContacto](
	[idDatoContacto] [int] IDENTITY(1,1) NOT NULL,
	[telefono1] [nvarchar](30) NULL,
	[extensionTel1] [nvarchar](10) NULL,
	[telefono2] [nvarchar](30) NULL,
	[extensionTel2] [nvarchar](10) NULL,
	[fax] [nvarchar](30) NULL,
	[celular] [nvarchar](30) NULL,
	[nextel] [nvarchar](30) NULL,
	[claveNextel] [nvarchar](10) NULL,
	[email1] [nvarchar](50) NOT NULL,
	[email2] [nvarchar](50) NULL,
	[messenger] [nvarchar](50) NULL,
	[skype] [nvarchar](50) NULL,
 CONSTRAINT [PK_DatoContacto] PRIMARY KEY CLUSTERED 
(
	[idDatoContacto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Consulta]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[idEntidad] [smallint] NOT NULL,
	[idTipoCredito] [int] NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[financiamiento] [int] NOT NULL,
	[cofinanciamiento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[EntidadFinanciamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadFinanciamiento](
	[idEntidad] [smallint] NOT NULL,
	[idTipoCredito] [smallint] NOT NULL CONSTRAINT [DF_EntidadFinanciamiento_idTipoCredito]  DEFAULT ((1)),
	[clave] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[financiamiento] [bit] NOT NULL CONSTRAINT [DF_EntidadFinanciamiento_financiamiento]  DEFAULT ((1)),
	[cofinanciamiento] [bit] NOT NULL CONSTRAINT [DF_EntidadFinanciamiento_cofinanciamiento]  DEFAULT ((1)),
 CONSTRAINT [PK_EntidadFinanciamiento] PRIMARY KEY CLUSTERED 
(
	[idEntidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Universidad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universidad](
	[idUniversidad] [smallint] NOT NULL,
	[nombreUniversidad] [nvarchar](100) NOT NULL,
	[tienePosgrados] [bit] NOT NULL,
 CONSTRAINT [PK_Universidad] PRIMARY KEY CLUSTERED 
(
	[idUniversidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ColegioValuadores]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColegioValuadores](
	[idcolegioValuadores] [smallint] NOT NULL,
	[nombreColegio] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_ColegioValuadores] PRIMARY KEY CLUSTERED 
(
	[idcolegioValuadores] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Cliente]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[idDatoContacto] [int] NOT NULL,
	[idDatoPaqueteria] [int] NULL,
	[idDatoBancario] [int] NULL,
	[idLogotipo] [int] NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[paginaWeb] [nvarchar](50) NULL,
	[fechaAlta] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valuador](
	[idValuador] [int] IDENTITY(1,1) NOT NULL,
	[idTipoValuador] [smallint] NOT NULL CONSTRAINT [DF_Valuador_idTipoValuador]  DEFAULT ((1)),
	[idDireccion] [int] NOT NULL,
	[idDatoContacto] [int] NOT NULL,
	[idDatoBancario] [int] NULL,
	[idDatoPaqueteria] [int] NULL,
	[idFotografia] [int] NULL,
	[idFormacionValuacion] [int] NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[nombreAsistente] [nvarchar](50) NULL,
	[emailAsistente] [nvarchar](50) NULL,
	[externo] [bit] NOT NULL CONSTRAINT [DF_Valuador_externo]  DEFAULT ((1)),
	[activo] [bit] NOT NULL CONSTRAINT [DF_Valuador_activo]  DEFAULT ((1)),
	[fechaAlta] [datetime] NOT NULL CONSTRAINT [DF_Valuador_fechaAlta]  DEFAULT (getdate()),
 CONSTRAINT [PK_Valuador] PRIMARY KEY CLUSTERED 
(
	[idValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ValorServicio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValorServicio](
	[idValorServicio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[idTipoServicio] [smallint] NOT NULL,
 CONSTRAINT [PK_valorServicio] PRIMARY KEY CLUSTERED 
(
	[idValorServicio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AvaluoReferencia]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvaluoReferencia](
	[idAvaluoReferencia] [int] IDENTITY(1,1) NOT NULL,
	[idValuador] [int] NOT NULL,
	[idArchivo] [int] NOT NULL,
	[fechaElaboracion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_AvaluoReferencia] PRIMARY KEY CLUSTERED 
(
	[idAvaluoReferencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AsignacionAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionAvaluo](
	[idAvaluo] [int] NOT NULL,
	[idValuador] [int] NOT NULL,
	[idControlador] [int] NOT NULL,
 CONSTRAINT [PK_AsignacionAvaluo] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoFacturacionValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoFacturacionValuador](
	[idDatoFacturacion] [int] NOT NULL,
	[idValuador] [int] NOT NULL,
 CONSTRAINT [PK_DatoFacturacionValuador] PRIMARY KEY CLUSTERED 
(
	[idDatoFacturacion] ASC,
	[idValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[FormacionProfesionalValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormacionProfesionalValuador](
	[idFormacionProfesional] [int] NOT NULL,
	[idValuador] [int] NOT NULL,
	[idTipoFormacion] [smallint] NOT NULL,
 CONSTRAINT [PK_FormacionProfesionalValuador] PRIMARY KEY CLUSTERED 
(
	[idFormacionProfesional] ASC,
	[idValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RegistroSHF]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroSHF](
	[idValuador] [int] NOT NULL,
	[numeroRegistro] [smallint] NOT NULL,
	[claveSHF] [nvarchar](30) NOT NULL,
	[fechaAlta] [smalldatetime] NOT NULL,
	[vigencia] [smalldatetime] NOT NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_RegistroSHF] PRIMARY KEY CLUSTERED 
(
	[idValuador] ASC,
	[numeroRegistro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UsuarioValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioValuador](
	[idUsuario] [int] NOT NULL,
	[idValuador] [int] NOT NULL,
	[master] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioValuador] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DocumentoValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoValuador](
	[idDocumento] [int] IDENTITY(1,1) NOT NULL,
	[idValuador] [int] NOT NULL,
	[idTipoDocumento] [smallint] NOT NULL,
 CONSTRAINT [PK_DocumentoValuador] PRIMARY KEY CLUSTERED 
(
	[idDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RechazoAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RechazoAvaluo](
	[idRechazo] [int] IDENTITY(1,1) NOT NULL,
	[idAvaluo] [int] NOT NULL,
	[idPersonal] [int] NULL,
	[idControlador] [int] NULL,
	[comentarios] [nvarchar](512) NOT NULL,
	[fechaRechazo] [datetime] NOT NULL,
	[corregido] [bigint] NOT NULL,
 CONSTRAINT [PK_RechazoAvaluo] PRIMARY KEY CLUSTERED 
(
	[idRechazo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoConstruccion](
	[idConstruccion] [int] NOT NULL,
	[numeroTipo] [smallint] NOT NULL,
	[idClase] [smallint] NOT NULL,
	[idConservacion] [smallint] NOT NULL,
	[idFuente] [smallint] NOT NULL,
	[otraFuente] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[superficie] [float] NOT NULL,
	[accesorio] [bit] NOT NULL,
	[niveles] [smallint] NOT NULL,
	[edad] [float] NOT NULL,
	[avanceObra] [float] NOT NULL,
	[vidaUtil] [float] NOT NULL,
 CONSTRAINT [PK_TipoConstruccion_1] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC,
	[numeroTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[InstalacionesEspecialesConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstalacionesEspecialesConstruccion](
	[idConstruccion] [int] NOT NULL,
	[economizadorAguaWC] [bit] NOT NULL,
	[sistemaDualWC] [bit] NOT NULL,
	[regaderaAhorradora] [bit] NOT NULL,
	[llavesAhorradoras] [bit] NOT NULL,
	[calentadorGasInstantaneo] [bit] NOT NULL,
	[calentadorSolarAgua] [bit] NOT NULL,
	[aireAcondicionado] [bit] NOT NULL,
	[aislamientoTecho] [bit] NOT NULL,
	[captacionEnergia] [bit] NOT NULL,
	[vozDatos] [bit] NOT NULL,
	[interfon] [bit] NOT NULL,
	[dosCircuitos] [bit] NOT NULL,
	[accesoria] [bit] NOT NULL,
	[cisterna] [bit] NOT NULL,
	[ductoClima] [bit] NOT NULL,
	[jaulaTendido] [bit] NOT NULL,
	[rejasVentanas] [bit] NOT NULL,
	[banioDiscapacitado] [bit] NOT NULL,
	[puertaDiscapacitado] [bit] NOT NULL,
	[accesoriosDiscapacitado] [bit] NOT NULL,
	[pasamanos] [bit] NOT NULL,
	[areasDiscapacitado] [bit] NOT NULL,
	[otrasInstalaciones] [nvarchar](150) NOT NULL,
	[otrasObras] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_InstalacionesEspecialesConstruccion] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[InstalacionConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstalacionConstruccion](
	[idConstruccion] [int] NOT NULL,
	[idInstalacion] [int] IDENTITY(1,1) NOT NULL,
	[idTipoUnidad] [smallint] NOT NULL,
	[idTipoConservacion] [smallint] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[cantidad] [float] NOT NULL,
	[edad] [float] NOT NULL,
	[comun] [bit] NOT NULL,
 CONSTRAINT [PK_InstalacionConstruccion] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC,
	[idInstalacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[InstalacionesEspecialesCondominio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstalacionesEspecialesCondominio](
	[idConstruccion] [int] NOT NULL,
	[tratamientoAgua] [bit] NOT NULL,
	[captacionAgua] [bit] NOT NULL,
	[separacionBasura] [bit] NOT NULL,
	[redAguaPurificada] [bit] NOT NULL,
	[casetaVigilancia] [bit] NOT NULL,
	[localesComerciales] [bit] NOT NULL,
	[bardaPerimetral] [bit] NOT NULL,
	[elevador] [bit] NOT NULL,
	[estacionamientoVisitas] [bit] NOT NULL,
	[estacionamientoDiscapacitados] [bit] NOT NULL,
	[juegosInfantiles] [bit] NOT NULL,
	[canchasDeportivas] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasCondominio] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AreaComun]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaComun](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[idCondominio] [int] NOT NULL,
	[concepto] [nvarchar](40) NOT NULL,
	[superficie] [float] NOT NULL,
 CONSTRAINT [PK_AreaComun] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[FormacionProfesional]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormacionProfesional](
	[idFormacionProfesional] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [smallint] NOT NULL,
	[idUniversidad] [smallint] NOT NULL,
	[cedula] [nvarchar](20) NOT NULL,
	[fechaCedula] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_FormacionProfesional] PRIMARY KEY CLUSTERED 
(
	[idFormacionProfesional] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ValorMaterial]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValorMaterial](
	[idValorMaterial] [int] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[idTipoMaterial] [smallint] NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_ValorMaterial] PRIMARY KEY CLUSTERED 
(
	[idValorMaterial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RevisionAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevisionAvaluo](
	[idRevision] [int] IDENTITY(1,1) NOT NULL,
	[idAvaluo] [int] NOT NULL,
	[idPersonal] [int] NOT NULL,
	[fechaAsignacion] [datetime] NOT NULL,
	[completada] [bit] NOT NULL,
 CONSTRAINT [PK_RevisionAvaluo] PRIMARY KEY CLUSTERED 
(
	[idRevision] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UsoActualRecamara]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsoActualRecamara](
	[idUsoRecamara] [int] IDENTITY(1,1) NOT NULL,
	[idUsoActual] [int] NOT NULL,
	[tipo] [smallint] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[nivel] [smallint] NOT NULL,
	[espacioCloset] [bit] NOT NULL,
	[closetEquipado] [bit] NOT NULL,
	[balcon] [bit] NOT NULL,
	[vestidor] [bit] NOT NULL,
	[terraza] [bit] NOT NULL,
	[banio] [bit] NOT NULL,
 CONSTRAINT [PK_UsoActualRecamara] PRIMARY KEY CLUSTERED 
(
	[idUsoRecamara] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UsoActualArea]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsoActualArea](
	[idUsoArea] [int] IDENTITY(1,1) NOT NULL,
	[idUsoActual] [int] NOT NULL,
	[nivel] [smallint] NOT NULL,
	[cuartoServicio] [bit] NOT NULL,
	[cuartoLavado] [bit] NOT NULL,
	[areaServicio] [bit] NOT NULL,
	[sala] [bit] NOT NULL,
	[banios] [smallint] NOT NULL,
	[baniosMedios] [smallint] NOT NULL,
	[otros] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_UsoActualArea] PRIMARY KEY CLUSTERED 
(
	[idUsoArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoDensidad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDensidad](
	[idTipoDensidad] [smallint] NOT NULL,
	[Densidad] [nvarchar](30) NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_TipoDensidad] PRIMARY KEY CLUSTERED 
(
	[idTipoDensidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoConstruccionPredominante]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoConstruccionPredominante](
	[idTipoConstruccionPredominante] [smallint] NOT NULL,
	[descripcion] [nvarchar](150) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_ConstruccionPredominante_1] PRIMARY KEY CLUSTERED 
(
	[idTipoConstruccionPredominante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoProximidadUrbana]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProximidadUrbana](
	[idTipoProximidadUrbana] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_TipoProximidadUrbana] PRIMARY KEY CLUSTERED 
(
	[idTipoProximidadUrbana] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoUsoSuelo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsoSuelo](
	[idTipoUsoSuelo] [smallint] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_TipoUsoSuelo] PRIMARY KEY CLUSTERED 
(
	[idTipoUsoSuelo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoClasificacionZona]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoClasificacionZona](
	[idTipoClasificacionZona] [smallint] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_TipoClasificacionZona] PRIMARY KEY CLUSTERED 
(
	[idTipoClasificacionZona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoNivelSocioeconomico]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoNivelSocioeconomico](
	[idTipoNivelEconomico] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
	[idClase] [smallint] NULL,
 CONSTRAINT [PK_TipoNivelSocioeconomico] PRIMARY KEY CLUSTERED 
(
	[idTipoNivelEconomico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoFacturacion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoFacturacion](
	[idDatoFacturacion] [int] NOT NULL,
	[idDireccion] [int] NOT NULL,
	[razonSocial] [nvarchar](50) NOT NULL,
	[nombreComercial] [nvarchar](50) NOT NULL,
	[RFC] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_DatoFacturacion] PRIMARY KEY CLUSTERED 
(
	[idDatoFacturacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoPaqueteria]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoPaqueteria](
	[idDatoPaqueteria] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[atencion] [nvarchar](50) NOT NULL,
	[plaza] [nvarchar](30) NULL,
	[envioFacturas] [bit] NOT NULL,
	[envioAvaluos] [bit] NOT NULL,
	[envioNotasRetencion] [bit] NOT NULL,
 CONSTRAINT [PK_DatoPaqueteriaValuador] PRIMARY KEY CLUSTERED 
(
	[idDatoPaqueteria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Propietario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[idPropietario] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[CURP] [nvarchar](30) NOT NULL,
	[RFC] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[idPropietario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Solicitante]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitante](
	[idSolicitante] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[NSS] [nvarchar](30) NOT NULL,
	[CURP] [nvarchar](30) NOT NULL,
	[RFC] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Solicitante] PRIMARY KEY CLUSTERED 
(
	[idSolicitante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DireccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionInmueble](
	[idDireccionInmueble] [int] IDENTITY(1,1) NOT NULL,
	[idDireccion] [int] NOT NULL,
	[edificio] [nvarchar](20) NOT NULL,
	[lote] [nvarchar](10) NOT NULL,
	[manzana] [nvarchar](50) NOT NULL,
	[superManzana] [nvarchar](30) NOT NULL,
	[condominio] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DireccionInmueble] PRIMARY KEY CLUSTERED 
(
	[idDireccionInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Archivo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archivo](
	[idArchivo] [int] IDENTITY(1,1) NOT NULL,
	[idCarpeta] [smallint] NOT NULL,
	[idTipo] [int] NOT NULL,
	[titulo] [nvarchar](20) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[extension] [nvarchar](5) NOT NULL,
	[tipoMIME] [nvarchar](35) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Archivo] PRIMARY KEY CLUSTERED 
(
	[idArchivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[EstadosColindantes]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosColindantes](
	[claveEstado] [int] NOT NULL,
	[claveEstadoColindante] [int] NOT NULL,
 CONSTRAINT [PK_EstadosColindantes] PRIMARY KEY CLUSTERED 
(
	[claveEstado] ASC,
	[claveEstadoColindante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Municipio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[claveMunicipio] [int] NOT NULL,
	[claveEstado] [int] NOT NULL,
	[nombreMunicipio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Asentamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asentamiento](
	[idAsentamiento] [int] IDENTITY(1,1) NOT NULL,
	[idMunicipio] [int] NOT NULL,
	[idTipoAsentamiento] [smallint] NOT NULL,
	[nombreAsentamiento] [nvarchar](100) NOT NULL,
	[capturado] [bit] NOT NULL,
 CONSTRAINT [PK_Asentamiento] PRIMARY KEY CLUSTERED 
(
	[idAsentamiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[CodigoPostal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CodigoPostal](
	[idCodigoPostal] [int] IDENTITY(1,1) NOT NULL,
	[idAsentamiento] [int] NOT NULL,
	[codigoPostal] [char](5) NOT NULL,
	[capturado] [bit] NOT NULL,
 CONSTRAINT [PK_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[idCodigoPostal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[idCodigoPostal] [int] NOT NULL,
	[calle] [nvarchar](80) NOT NULL,
	[numeroExterior] [nvarchar](10) NOT NULL,
	[numeroInterior] [nvarchar](10) NULL,
	[entre1] [nvarchar](50) NULL,
	[entre2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvaluoInmobiliario](
	[idAvaluo] [int] IDENTITY(1,1) NOT NULL,
	[IDE] [nvarchar](20) NULL,
	[idCliente] [int] NULL,
	[idInmueble] [int] NOT NULL,
	[idSubTipo] [smallint] NOT NULL,
	[idSolicitante] [int] NOT NULL,
	[idStatus] [smallint] NOT NULL,
	[idProposito] [smallint] NOT NULL,
	[especRecuperacion] [nvarchar](20) NOT NULL,
	[especProposito] [nvarchar](30) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaFinalizacion] [datetime] NULL,
	[promocionVIASC] [bit] NOT NULL,
	[operacionContado] [bit] NOT NULL,
	[activo] [bit] NOT NULL CONSTRAINT [DF_AvaluoInmobiliario_activo]  DEFAULT ((1)),
 CONSTRAINT [PK_AvaluoInmobiliario] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoBancario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatoBancario](
	[idDatoBancario] [int] NOT NULL,
	[idBancoRecepcion] [smallint] NOT NULL,
	[idBancoEnvio] [smallint] NULL,
	[sucursalRecepcion] [nvarchar](15) NOT NULL,
	[cuentaRecepcion] [char](10) NOT NULL,
	[CLABERecepcion] [char](15) NOT NULL,
	[beneficiarioRecepcion] [nvarchar](50) NOT NULL,
	[refNumericaRecepcion] [nvarchar](30) NOT NULL,
	[refAlfanumericaRecepcion] [nvarchar](30) NOT NULL,
	[refNumericaEnvio] [nvarchar](30) NULL,
	[refAlfanuericaEnvio] [nvarchar](30) NULL,
 CONSTRAINT [PK_DatoBancario] PRIMARY KEY CLUSTERED 
(
	[idDatoBancario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[idInmueble] [int] IDENTITY(1,1) NOT NULL,
	[idPropietario] [int] NOT NULL,
	[idTipoInmueble] [smallint] NOT NULL,
	[idRegimenPropiedad] [smallint] NOT NULL,
	[idDireccionInmueble] [int] NOT NULL,
	[otroTipoInmueble] [nvarchar](50) NOT NULL,
	[claveCatastral] [nvarchar](30) NOT NULL,
	[cuentaPredial] [nvarchar](30) NOT NULL,
	[cuentaAgua] [nvarchar](30) NOT NULL,
	[telefono] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Inmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[RolUsuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolUsuario](
	[idUsuario] [int] NOT NULL,
	[idRol] [smallint] NOT NULL,
 CONSTRAINT [PK_RolUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoCredito]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoCredito](
	[idAvaluo] [int] NOT NULL,
	[idTipoCredito] [smallint] NOT NULL,
	[idTipoCreditoInterno] [smallint] NULL,
	[idEntidadOtorgante] [smallint] NOT NULL,
	[idEntidadCofinanciamiento] [smallint] NULL,
 CONSTRAINT [PK_DatosSHF] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AcabadoTipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcabadoTipoConstruccion](
	[idConstruccion] [int] NOT NULL,
	[numeroTipo] [smallint] NOT NULL,
	[idTipoAcabado] [smallint] NOT NULL,
	[idTipoPiso] [smallint] NOT NULL,
	[idTipoMuro] [smallint] NOT NULL,
	[idTipoPlafon] [smallint] NOT NULL,
 CONSTRAINT [PK_AcabadoTipoConstruccion] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC,
	[numeroTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UsuarioCliente]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioCliente](
	[idUsuario] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[master] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioCliente] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Personal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[idPersonal] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[idPersonal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[HistorialRevision]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialRevision](
	[idHistorial] [int] IDENTITY(1,1) NOT NULL,
	[idRevision] [int] NOT NULL,
	[idCapturaAvaluo] [int] NULL,
	[observaciones] [nvarchar](512) NULL,
	[fechaRevision] [datetime] NOT NULL,
 CONSTRAINT [PK_HistorialRevision] PRIMARY KEY CLUSTERED 
(
	[idHistorial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[TipoCreditoInterno]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCreditoInterno](
	[idTipoCreditoInterno] [smallint] NOT NULL,
	[idEntidad] [smallint] NOT NULL,
	[descripcion] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoINFONAVIT] PRIMARY KEY CLUSTERED 
(
	[idTipoCreditoInterno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[EstructurasTipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstructurasTipoConstruccion](
	[idConstruccion] [int] NOT NULL,
	[numeroTipo] [smallint] NOT NULL,
	[idTipoCimentacion] [smallint] NOT NULL,
	[idTipoEntrepisos] [smallint] NOT NULL,
	[idTipoMuros] [smallint] NOT NULL,
	[idTipoTrabes] [smallint] NOT NULL,
	[idTipoEscaleras] [smallint] NOT NULL,
 CONSTRAINT [PK_EstructurasTipoConstruccion] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC,
	[numeroTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[InstalacionesTipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstalacionesTipoConstruccion](
	[idConstruccion] [int] NOT NULL,
	[numeroTipo] [smallint] NOT NULL,
	[idTipoHidraulica] [nvarchar](120) NOT NULL,
	[idTipoElectrica] [nvarchar](120) NOT NULL,
	[idTipoCanceleria] [nvarchar](70) NOT NULL,
	[idTipoHerreria] [nvarchar](70) NOT NULL,
	[idTipoCarpinteria] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_InstalacionesInmueble] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC,
	[numeroTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ServiciosInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosInmueble](
	[idInmueble] [int] NOT NULL,
	[idTipoGasNatural] [smallint] NOT NULL,
	[idTipoRedTelefonica] [smallint] NOT NULL,
	[transporteUrbanoDistancia] [float] NOT NULL,
	[transporteUrbanoFrecuencia] [float] NOT NULL,
	[transporteSuburbanoDistancia] [float] NOT NULL,
	[transporteSuburbanoFrecuencia] [float] NOT NULL,
	[idTipoVigilancia] [smallint] NOT NULL,
	[senalizacion] [bit] NOT NULL,
	[nomenclatura] [bit] NOT NULL,
	[recoleccionBasura] [bit] NOT NULL,
	[distanciaIglesia] [float] NOT NULL,
	[distanciaEscuela] [float] NOT NULL,
	[distanciaEstacionTransporte] [float] NOT NULL,
	[distanciaMercado] [float] NOT NULL,
	[distanciaHospital] [float] NOT NULL,
	[distanciaPlaza] [float] NOT NULL,
	[distanciaParque] [float] NOT NULL,
	[distanciaBanco] [float] NOT NULL,
	[proximidadGeneral] [float] NOT NULL,
	[nivelEquipamientoUrbano] [smallint] NOT NULL,
 CONSTRAINT [PK_ServiciosInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[SuperficiesInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuperficiesInmueble](
	[idInmueble] [int] NOT NULL,
	[totalTerreno] [float] NOT NULL,
	[frenteLote] [float] NOT NULL,
	[fuenteTerreno] [int] NOT NULL,
	[otraFuenteTerreno] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SuperficiesInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UsoActualInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsoActualInmueble](
	[idUsoActual] [int] IDENTITY(1,1) NOT NULL,
	[idInmueble] [int] NOT NULL,
	[idTipoEstacionamiento] [smallint] NOT NULL,
	[cupoEstacionamiento] [smallint] NOT NULL,
	[jardinesFrontales] [bit] NOT NULL,
	[jardinesFondo] [bit] NOT NULL,
	[jardinesLateral] [bit] NOT NULL,
	[elevador] [bit] NOT NULL,
	[vestibulo] [bit] NOT NULL,
	[escaleraPrincipal] [bit] NOT NULL,
	[escaleraServicio] [bit] NOT NULL,
	[cocina] [bit] NOT NULL,
	[cocinaMuebles] [bit] NOT NULL CONSTRAINT [DF_UsoActualInmueble_cocinaMuebles]  DEFAULT ((0)),
	[cocinaIntegral] [bit] NOT NULL CONSTRAINT [DF_UsoActualInmueble_cocinaIntegral]  DEFAULT ((0)),
	[comedor] [bit] NOT NULL,
	[despensa] [bit] NOT NULL,
	[numBaniosCompletos] [smallint] NOT NULL,
	[numBaniosMedios] [smallint] NOT NULL,
	[numRecamaras] [smallint] NOT NULL,
 CONSTRAINT [PK_UsoActualInmueble] PRIMARY KEY CLUSTERED 
(
	[idUsoActual] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[UbicacionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionInmueble](
	[idInmueble] [int] NOT NULL,
	[idTipoUbicacion] [smallint] NOT NULL,
	[idTipoConfiguracion] [smallint] NOT NULL,
	[idTipotopografia] [smallint] NOT NULL,
	[idTipoUsoSuelo] [smallint] NOT NULL,
	[idFuenteMedida] [smallint] NOT NULL,
	[otraFuente] [nvarchar](50) NOT NULL,
	[idFuenteDensidad] [smallint] NOT NULL,
	[densidadHabitantes] [float] NOT NULL,
	[densidadViviendas] [float] NOT NULL,
	[frentes] [smallint] NOT NULL,
	[lados] [smallint] NOT NULL,
	[descripcionColindancias] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_UbicacionInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[EscriturasInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscriturasInmueble](
	[idInmueble] [int] NOT NULL,
	[numero] [nvarchar](25) NOT NULL,
	[libro] [nvarchar](10) NOT NULL,
	[volumen] [nvarchar](10) NOT NULL,
	[notario] [nvarchar](50) NOT NULL,
	[notaria] [nvarchar](30) NOT NULL,
	[plaza] [nvarchar](50) NOT NULL,
	[fecha] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EscriturasInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[InfraestructuraInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfraestructuraInmueble](
	[idInmueble] [int] NOT NULL,
	[idTipoAguaPotable] [smallint] NOT NULL,
	[idTipoElectrificacion] [smallint] NOT NULL,
	[idTipoDrenaje] [smallint] NOT NULL,
	[idTipoAlumbrado] [smallint] NOT NULL,
	[idTipoVialidades] [smallint] NOT NULL,
	[otroVialidades] [nvarchar](50) NOT NULL,
	[anchoVialidades] [float] NOT NULL,
	[idTipoBanquetas] [smallint] NOT NULL,
	[otroBanquetas] [nvarchar](50) NOT NULL,
	[anchoBanquetas] [float] NOT NULL,
	[idTipoGuarniciones] [smallint] NOT NULL,
	[otroGuarniciones] [nvarchar](50) NOT NULL,
	[anchoGuarniciones] [float] NOT NULL,
	[nivelInfraestructura] [float] NOT NULL,
	[nivelInfraestructuraSHF] [smallint] NOT NULL,
 CONSTRAINT [PK_InfraestructuraInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ConstruccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstruccionInmueble](
	[idConstruccion] [int] IDENTITY(1,1) NOT NULL,
	[idInmueble] [int] NOT NULL,
	[idClase] [smallint] NOT NULL,
	[idConservacion] [smallint] NOT NULL,
	[idCalidadProyecto] [smallint] NOT NULL,
	[constructor] [nvarchar](50) NOT NULL,
	[avanceObra] [float] NOT NULL,
	[edad] [float] NOT NULL,
	[vidaUtil] [float] NOT NULL,
	[nivelesConstruccion] [smallint] NOT NULL,
	[nivelEdificio] [smallint] NOT NULL,
	[horizontal] [bit] NOT NULL,
	[vertical] [bit] NOT NULL,
 CONSTRAINT [PK_ConstruccionInmueble] PRIMARY KEY CLUSTERED 
(
	[idConstruccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[DatoCondominio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoCondominio](
	[idCondominio] [int] IDENTITY(1,1) NOT NULL,
	[idInmueble] [int] NOT NULL,
	[totalTerreno] [float] NOT NULL,
	[indiviso] [float] NOT NULL CONSTRAINT [DF_DatosCondominio_indiviso]  DEFAULT ((0)),
	[privativo] [float] NOT NULL CONSTRAINT [DF_DatosCondominio_privativo]  DEFAULT ((0)),
	[fuenteIndiviso] [int] NOT NULL CONSTRAINT [DF_DatosCondominio_fuenteIndiviso]  DEFAULT ((0)),
	[otraFuenteIndiviso] [nvarchar](50) NOT NULL,
	[fuentePrivativo] [int] NOT NULL CONSTRAINT [DF_DatosCondominio_fuentePrivativo]  DEFAULT ((0)),
	[otraFuentePrivativo] [nvarchar](50) NOT NULL,
	[avanceObra] [float] NOT NULL,
	[unidadesRentables] [int] NOT NULL,
	[unidadesNucleo] [int] NOT NULL,
	[unidadesConjunto] [int] NOT NULL,
 CONSTRAINT [PK_DatosCondominio] PRIMARY KEY CLUSTERED 
(
	[idCondominio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ViasAcceso]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViasAcceso](
	[idViaAcceso] [int] IDENTITY(1,1) NOT NULL,
	[idInmueble] [int] NOT NULL,
	[idImportanciaVia] [smallint] NOT NULL,
	[nombreVia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ViasAcceso] PRIMARY KEY CLUSTERED 
(
	[idViaAcceso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[GeolocalizacionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeolocalizacionInmueble](
	[idInmueble] [int] NOT NULL,
	[formatoAbsoluto] [bit] NOT NULL,
	[longitud] [decimal](18, 0) NOT NULL,
	[latitud] [decimal](18, 0) NOT NULL,
	[altitud] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_LocalizacionInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[EntornoInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntornoInmueble](
	[idInmueble] [int] NOT NULL,
	[idTipoClasificacionZona] [smallint] NOT NULL,
	[idTipoConstrucciones] [smallint] NOT NULL,
	[idTipoCaracteristicasPanoramicas] [smallint] NOT NULL,
	[idTipoDensidadPoblacion] [smallint] NOT NULL,
	[idTipoProximidadUrbana] [smallint] NOT NULL,
	[idTipoNivelSocioEconomico] [smallint] NOT NULL,
	[indiceSaturacion] [smallint] NOT NULL,
 CONSTRAINT [PK_EntornoInmueble] PRIMARY KEY CLUSTERED 
(
	[idInmueble] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[AsignacionFolioSHF]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionFolioSHF](
	[idAvaluo] [int] NOT NULL,
	[folio] [nvarchar](15) NOT NULL,
	[consecutivo] [int] NOT NULL,
	[periodo] [smallint] NOT NULL,
 CONSTRAINT [PK_AsignacionFolioSHF] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Declaraciones]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Declaraciones](
	[idAvaluo] [int] NOT NULL,
	[declaracionIdentificacion] [bit] NOT NULL,
	[declaracionSuperficies] [bit] NOT NULL,
	[declaracionConstrucciones] [bit] NOT NULL,
	[declaracionMonumento] [bit] NOT NULL,
	[declaracionPatrimonio] [bit] NOT NULL,
	[advertenciaDocumentacion] [bit] NOT NULL,
	[advertenciaOfertas] [bit] NOT NULL,
	[advertenciaUso] [bit] NOT NULL,
	[advertenciaObras] [bit] NOT NULL,
	[otrasAdvertencias] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_DeclaracionesAvaluoInmobiliario] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ConclusionAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConclusionAvaluo](
	[idAvaluo] [int] NOT NULL,
	[comentarios] [nvarchar](300) NOT NULL,
	[valorConcluido] [money] NOT NULL,
	[consideraciones] [nvarchar](512) NOT NULL,
	[observaciones] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_ConclusionAvaluoInmobiliario] PRIMARY KEY CLUSTERED 
(
	[idAvaluo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[FormacionValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormacionValuador](
	[idFormacionValuador] [int] IDENTITY(1,1) NOT NULL,
	[idColegio] [smallint] NOT NULL,
	[registro] [nvarchar](30) NOT NULL,
	[fechaIngreso] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_FormacionValuador] PRIMARY KEY CLUSTERED 
(
	[idFormacionValuador] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  StoredProcedure [dbo].[GenerarIDE]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerarIDE] 
	@mes SMALLINT,
	@periodo SMALLINT,
	@consecutivo INT=NULL OUTPUT,
	@IDE NVARCHAR(20) OUTPUT
AS
	SET NOCOUNT OFF
	
	SET @consecutivo = (SELECT consecutivo FROM GeneracionIDE WITH(updlock) WHERE periodo = @periodo)
	IF @consecutivo IS NULL
		SET @consecutivo = 1	
	ELSE
		SET @consecutivo = @consecutivo + 1
			
	IF @consecutivo > 1
		UPDATE GeneracionIDE SET consecutivo = @consecutivo, ultimaGeneracion = getdate() WHERE periodo = @periodo
	ELSE
		INSERT INTO GeneracionIDE(consecutivo, periodo, ultimaGeneracion)
			VALUES(@consecutivo, @periodo, getdate()) 

	SET @IDE = dbo.FormatearIDE(@consecutivo, @mes, @periodo)

	IF @@ERROR <> 0 BEGIN
		PRINT 'Error al crear el identificador para el avaluo'
		SET @consecutivo = -1
		SET @IDE = NULL

		SELECT 1
		RETURN 1
	END
	
	SELECT 0
	RETURN 0
GO
/****** Objeto:  ForeignKey [FK_AcabadoInmueble_TipoAcabado]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AcabadoTipoConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_AcabadoInmueble_TipoAcabado] FOREIGN KEY([idTipoAcabado])
REFERENCES [dbo].[TipoAcabado] ([idTipoAcabado])
GO
ALTER TABLE [dbo].[AcabadoTipoConstruccion] CHECK CONSTRAINT [FK_AcabadoInmueble_TipoAcabado]
GO
/****** Objeto:  ForeignKey [FK_AcabadoTipoConstruccion_TipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AcabadoTipoConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_AcabadoTipoConstruccion_TipoConstruccion] FOREIGN KEY([idConstruccion], [numeroTipo])
REFERENCES [dbo].[TipoConstruccion] ([idConstruccion], [numeroTipo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcabadoTipoConstruccion] CHECK CONSTRAINT [FK_AcabadoTipoConstruccion_TipoConstruccion]
GO
/****** Objeto:  ForeignKey [FK_Archivo_Carpeta]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Archivo]  WITH CHECK ADD  CONSTRAINT [FK_Archivo_Carpeta] FOREIGN KEY([idCarpeta])
REFERENCES [dbo].[Carpeta] ([idCarpeta])
GO
ALTER TABLE [dbo].[Archivo] CHECK CONSTRAINT [FK_Archivo_Carpeta]
GO
/****** Objeto:  ForeignKey [FK_AreaComun_DatosCondominio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AreaComun]  WITH CHECK ADD  CONSTRAINT [FK_AreaComun_DatosCondominio] FOREIGN KEY([idCondominio])
REFERENCES [dbo].[DatoCondominio] ([idCondominio])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AreaComun] CHECK CONSTRAINT [FK_AreaComun_DatosCondominio]
GO
/****** Objeto:  ForeignKey [FK_Asentamiento_Municipio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Asentamiento]  WITH NOCHECK ADD  CONSTRAINT [FK_Asentamiento_Municipio] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipio] ([idMunicipio])
GO
ALTER TABLE [dbo].[Asentamiento] CHECK CONSTRAINT [FK_Asentamiento_Municipio]
GO
/****** Objeto:  ForeignKey [FK_Asentamiento_TipoAsentamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Asentamiento]  WITH NOCHECK ADD  CONSTRAINT [FK_Asentamiento_TipoAsentamiento] FOREIGN KEY([idTipoAsentamiento])
REFERENCES [dbo].[TipoAsentamiento] ([idTipoAsentamiento])
GO
ALTER TABLE [dbo].[Asentamiento] CHECK CONSTRAINT [FK_Asentamiento_TipoAsentamiento]
GO
/****** Objeto:  ForeignKey [FK_AsignacionAvaluo_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AsignacionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionAvaluo_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
GO
ALTER TABLE [dbo].[AsignacionAvaluo] CHECK CONSTRAINT [FK_AsignacionAvaluo_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_AsignacionAvaluo_Controlador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AsignacionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionAvaluo_Controlador] FOREIGN KEY([idControlador])
REFERENCES [dbo].[Valuador] ([idValuador])
GO
ALTER TABLE [dbo].[AsignacionAvaluo] CHECK CONSTRAINT [FK_AsignacionAvaluo_Controlador]
GO
/****** Objeto:  ForeignKey [FK_AsignacionAvaluo_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AsignacionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionAvaluo_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
GO
ALTER TABLE [dbo].[AsignacionAvaluo] CHECK CONSTRAINT [FK_AsignacionAvaluo_Valuador]
GO
/****** Objeto:  ForeignKey [FK_AsignacionFolioSHF_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AsignacionFolioSHF]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionFolioSHF_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AsignacionFolioSHF] CHECK CONSTRAINT [FK_AsignacionFolioSHF_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_Cliente]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_Cliente]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_PropositoAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_PropositoAvaluo] FOREIGN KEY([idProposito])
REFERENCES [dbo].[PropositoAvaluo] ([idProposito])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_PropositoAvaluo]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_Solicitante]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_Solicitante] FOREIGN KEY([idSolicitante])
REFERENCES [dbo].[Solicitante] ([idSolicitante])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_Solicitante]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_StatusAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_StatusAvaluo] FOREIGN KEY([idStatus])
REFERENCES [dbo].[StatusAvaluo] ([idStatus])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_StatusAvaluo]
GO
/****** Objeto:  ForeignKey [FK_AvaluoInmobiliario_TipoAvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoInmobiliario]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoInmobiliario_TipoAvaluoInmobiliario] FOREIGN KEY([idSubTipo])
REFERENCES [dbo].[TipoAvaluoInmobiliario] ([idSubTipo])
GO
ALTER TABLE [dbo].[AvaluoInmobiliario] CHECK CONSTRAINT [FK_AvaluoInmobiliario_TipoAvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_AvaluoReferencia_Archivo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoReferencia]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoReferencia_Archivo] FOREIGN KEY([idArchivo])
REFERENCES [dbo].[Archivo] ([idArchivo])
GO
ALTER TABLE [dbo].[AvaluoReferencia] CHECK CONSTRAINT [FK_AvaluoReferencia_Archivo]
GO
/****** Objeto:  ForeignKey [FK_AvaluoReferencia_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[AvaluoReferencia]  WITH CHECK ADD  CONSTRAINT [FK_AvaluoReferencia_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AvaluoReferencia] CHECK CONSTRAINT [FK_AvaluoReferencia_Valuador]
GO
/****** Objeto:  ForeignKey [FK_Cliente_Archivo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Archivo] FOREIGN KEY([idLogotipo])
REFERENCES [dbo].[Archivo] ([idArchivo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Archivo]
GO
/****** Objeto:  ForeignKey [FK_Cliente_DatoBancario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_DatoBancario] FOREIGN KEY([idDatoBancario])
REFERENCES [dbo].[DatoBancario] ([idDatoBancario])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_DatoBancario]
GO
/****** Objeto:  ForeignKey [FK_Cliente_DatoContacto]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_DatoContacto] FOREIGN KEY([idDatoContacto])
REFERENCES [dbo].[DatoContacto] ([idDatoContacto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_DatoContacto]
GO
/****** Objeto:  ForeignKey [FK_Cliente_DatoPaqueteria]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_DatoPaqueteria] FOREIGN KEY([idDatoPaqueteria])
REFERENCES [dbo].[DatoPaqueteria] ([idDatoPaqueteria])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_DatoPaqueteria]
GO
/****** Objeto:  ForeignKey [FK_Cliente_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Direccion]
GO
/****** Objeto:  ForeignKey [FK_CodigoPostal_Asentamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[CodigoPostal]  WITH CHECK ADD  CONSTRAINT [FK_CodigoPostal_Asentamiento] FOREIGN KEY([idAsentamiento])
REFERENCES [dbo].[Asentamiento] ([idAsentamiento])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CodigoPostal] CHECK CONSTRAINT [FK_CodigoPostal_Asentamiento]
GO
/****** Objeto:  ForeignKey [FK_ConclusionAvaluo_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[ConclusionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_ConclusionAvaluo_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
GO
ALTER TABLE [dbo].[ConclusionAvaluo] CHECK CONSTRAINT [FK_ConclusionAvaluo_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_ConstruccionInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[ConstruccionInmueble]  WITH CHECK ADD  CONSTRAINT [FK_ConstruccionInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
GO
ALTER TABLE [dbo].[ConstruccionInmueble] CHECK CONSTRAINT [FK_ConstruccionInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_DatoBancario_BancoEnvio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoBancario]  WITH CHECK ADD  CONSTRAINT [FK_DatoBancario_BancoEnvio] FOREIGN KEY([idBancoEnvio])
REFERENCES [dbo].[Banco] ([idBanco])
GO
ALTER TABLE [dbo].[DatoBancario] CHECK CONSTRAINT [FK_DatoBancario_BancoEnvio]
GO
/****** Objeto:  ForeignKey [FK_DatoBancario_BancoRecepcion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoBancario]  WITH CHECK ADD  CONSTRAINT [FK_DatoBancario_BancoRecepcion] FOREIGN KEY([idBancoRecepcion])
REFERENCES [dbo].[Banco] ([idBanco])
GO
ALTER TABLE [dbo].[DatoBancario] CHECK CONSTRAINT [FK_DatoBancario_BancoRecepcion]
GO
/****** Objeto:  ForeignKey [FK_DatosCondominio_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCondominio]  WITH CHECK ADD  CONSTRAINT [FK_DatosCondominio_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatoCondominio] CHECK CONSTRAINT [FK_DatosCondominio_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_DatosCredito_EntidadCofinanciamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCredito]  WITH CHECK ADD  CONSTRAINT [FK_DatosCredito_EntidadCofinanciamiento] FOREIGN KEY([idEntidadCofinanciamiento])
REFERENCES [dbo].[EntidadFinanciamiento] ([idEntidad])
GO
ALTER TABLE [dbo].[DatoCredito] CHECK CONSTRAINT [FK_DatosCredito_EntidadCofinanciamiento]
GO
/****** Objeto:  ForeignKey [FK_DatosCredito_EntidadFinancimiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCredito]  WITH CHECK ADD  CONSTRAINT [FK_DatosCredito_EntidadFinancimiento] FOREIGN KEY([idEntidadOtorgante])
REFERENCES [dbo].[EntidadFinanciamiento] ([idEntidad])
GO
ALTER TABLE [dbo].[DatoCredito] CHECK CONSTRAINT [FK_DatosCredito_EntidadFinancimiento]
GO
/****** Objeto:  ForeignKey [FK_DatosCredito_TipoCreditoInterno]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCredito]  WITH CHECK ADD  CONSTRAINT [FK_DatosCredito_TipoCreditoInterno] FOREIGN KEY([idTipoCreditoInterno])
REFERENCES [dbo].[TipoCreditoInterno] ([idTipoCreditoInterno])
GO
ALTER TABLE [dbo].[DatoCredito] CHECK CONSTRAINT [FK_DatosCredito_TipoCreditoInterno]
GO
/****** Objeto:  ForeignKey [FK_DatosSHF_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCredito]  WITH CHECK ADD  CONSTRAINT [FK_DatosSHF_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatoCredito] CHECK CONSTRAINT [FK_DatosSHF_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_DatosSHF_TipoCredito]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoCredito]  WITH CHECK ADD  CONSTRAINT [FK_DatosSHF_TipoCredito] FOREIGN KEY([idTipoCredito])
REFERENCES [dbo].[TipoCredito] ([idTipoCredito])
GO
ALTER TABLE [dbo].[DatoCredito] CHECK CONSTRAINT [FK_DatosSHF_TipoCredito]
GO
/****** Objeto:  ForeignKey [FK_DatoFacturacion_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoFacturacion]  WITH CHECK ADD  CONSTRAINT [FK_DatoFacturacion_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[DatoFacturacion] CHECK CONSTRAINT [FK_DatoFacturacion_Direccion]
GO
/****** Objeto:  ForeignKey [FK_DatoFacturacionValuador_DatoFacturacion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoFacturacionValuador]  WITH CHECK ADD  CONSTRAINT [FK_DatoFacturacionValuador_DatoFacturacion] FOREIGN KEY([idDatoFacturacion])
REFERENCES [dbo].[DatoFacturacion] ([idDatoFacturacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatoFacturacionValuador] CHECK CONSTRAINT [FK_DatoFacturacionValuador_DatoFacturacion]
GO
/****** Objeto:  ForeignKey [FK_DatoFacturacionValuador_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoFacturacionValuador]  WITH CHECK ADD  CONSTRAINT [FK_DatoFacturacionValuador_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatoFacturacionValuador] CHECK CONSTRAINT [FK_DatoFacturacionValuador_Valuador]
GO
/****** Objeto:  ForeignKey [FK_DatoPaqueteria_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DatoPaqueteria]  WITH CHECK ADD  CONSTRAINT [FK_DatoPaqueteria_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatoPaqueteria] CHECK CONSTRAINT [FK_DatoPaqueteria_Direccion]
GO
/****** Objeto:  ForeignKey [FK_DeclaracionesAvaluoInmobiliario_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Declaraciones]  WITH CHECK ADD  CONSTRAINT [FK_DeclaracionesAvaluoInmobiliario_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Declaraciones] CHECK CONSTRAINT [FK_DeclaracionesAvaluoInmobiliario_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_Direccion_CodigoPostal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_CodigoPostal] FOREIGN KEY([idCodigoPostal])
REFERENCES [dbo].[CodigoPostal] ([idCodigoPostal])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_CodigoPostal]
GO
/****** Objeto:  ForeignKey [FK_DireccionInmueble_CodigoPostal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DireccionInmueble]  WITH CHECK ADD  CONSTRAINT [FK_DireccionInmueble_CodigoPostal] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[CodigoPostal] ([idCodigoPostal])
GO
ALTER TABLE [dbo].[DireccionInmueble] CHECK CONSTRAINT [FK_DireccionInmueble_CodigoPostal]
GO
/****** Objeto:  ForeignKey [FK_DireccionInmueble_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DireccionInmueble]  WITH CHECK ADD  CONSTRAINT [FK_DireccionInmueble_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[DireccionInmueble] CHECK CONSTRAINT [FK_DireccionInmueble_Direccion]
GO
/****** Objeto:  ForeignKey [FK_DocumentoValuador_TipoDocumentoValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DocumentoValuador]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoValuador_TipoDocumentoValuador] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TipoDocumentoValuador] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[DocumentoValuador] CHECK CONSTRAINT [FK_DocumentoValuador_TipoDocumentoValuador]
GO
/****** Objeto:  ForeignKey [FK_DocumentoValuador_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[DocumentoValuador]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoValuador_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DocumentoValuador] CHECK CONSTRAINT [FK_DocumentoValuador_Valuador]
GO
/****** Objeto:  ForeignKey [FK_EntornoInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[EntornoInmueble]  WITH CHECK ADD  CONSTRAINT [FK_EntornoInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntornoInmueble] CHECK CONSTRAINT [FK_EntornoInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_EscriturasInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[EscriturasInmueble]  WITH CHECK ADD  CONSTRAINT [FK_EscriturasInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EscriturasInmueble] CHECK CONSTRAINT [FK_EscriturasInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_EstadosColindantes_Estado]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[EstadosColindantes]  WITH CHECK ADD  CONSTRAINT [FK_EstadosColindantes_Estado] FOREIGN KEY([claveEstado])
REFERENCES [dbo].[Estado] ([claveEstado])
GO
ALTER TABLE [dbo].[EstadosColindantes] CHECK CONSTRAINT [FK_EstadosColindantes_Estado]
GO
/****** Objeto:  ForeignKey [FK_EstadosColindantes_EstadoColindante]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[EstadosColindantes]  WITH CHECK ADD  CONSTRAINT [FK_EstadosColindantes_EstadoColindante] FOREIGN KEY([claveEstadoColindante])
REFERENCES [dbo].[Estado] ([claveEstado])
GO
ALTER TABLE [dbo].[EstadosColindantes] CHECK CONSTRAINT [FK_EstadosColindantes_EstadoColindante]
GO
/****** Objeto:  ForeignKey [FK_EstructurasTipoConstruccion_TipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[EstructurasTipoConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_EstructurasTipoConstruccion_TipoConstruccion] FOREIGN KEY([idConstruccion], [numeroTipo])
REFERENCES [dbo].[TipoConstruccion] ([idConstruccion], [numeroTipo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EstructurasTipoConstruccion] CHECK CONSTRAINT [FK_EstructurasTipoConstruccion_TipoConstruccion]
GO
/****** Objeto:  ForeignKey [FK_FormacionProfesional_Carrera]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionProfesional]  WITH CHECK ADD  CONSTRAINT [FK_FormacionProfesional_Carrera] FOREIGN KEY([idCarrera])
REFERENCES [dbo].[Carrera] ([idCarrera])
GO
ALTER TABLE [dbo].[FormacionProfesional] CHECK CONSTRAINT [FK_FormacionProfesional_Carrera]
GO
/****** Objeto:  ForeignKey [FK_FormacionProfesional_Universidad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionProfesional]  WITH CHECK ADD  CONSTRAINT [FK_FormacionProfesional_Universidad] FOREIGN KEY([idUniversidad])
REFERENCES [dbo].[Universidad] ([idUniversidad])
GO
ALTER TABLE [dbo].[FormacionProfesional] CHECK CONSTRAINT [FK_FormacionProfesional_Universidad]
GO
/****** Objeto:  ForeignKey [FK_FormacionProfesionalValuador_FormacionProfesional]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionProfesionalValuador]  WITH CHECK ADD  CONSTRAINT [FK_FormacionProfesionalValuador_FormacionProfesional] FOREIGN KEY([idFormacionProfesional])
REFERENCES [dbo].[FormacionProfesional] ([idFormacionProfesional])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormacionProfesionalValuador] CHECK CONSTRAINT [FK_FormacionProfesionalValuador_FormacionProfesional]
GO
/****** Objeto:  ForeignKey [FK_FormacionProfesionalValuador_TipoFormacionProfesional]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionProfesionalValuador]  WITH CHECK ADD  CONSTRAINT [FK_FormacionProfesionalValuador_TipoFormacionProfesional] FOREIGN KEY([idTipoFormacion])
REFERENCES [dbo].[TipoFormacionProfesional] ([idTipoFormacion])
GO
ALTER TABLE [dbo].[FormacionProfesionalValuador] CHECK CONSTRAINT [FK_FormacionProfesionalValuador_TipoFormacionProfesional]
GO
/****** Objeto:  ForeignKey [FK_FormacionProfesionalValuador_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionProfesionalValuador]  WITH CHECK ADD  CONSTRAINT [FK_FormacionProfesionalValuador_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormacionProfesionalValuador] CHECK CONSTRAINT [FK_FormacionProfesionalValuador_Valuador]
GO
/****** Objeto:  ForeignKey [FK_FormacionValuador_ColegioValuadores]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[FormacionValuador]  WITH CHECK ADD  CONSTRAINT [FK_FormacionValuador_ColegioValuadores] FOREIGN KEY([idColegio])
REFERENCES [dbo].[ColegioValuadores] ([idcolegioValuadores])
GO
ALTER TABLE [dbo].[FormacionValuador] CHECK CONSTRAINT [FK_FormacionValuador_ColegioValuadores]
GO
/****** Objeto:  ForeignKey [FK_GeolocalizacionInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[GeolocalizacionInmueble]  WITH CHECK ADD  CONSTRAINT [FK_GeolocalizacionInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
GO
ALTER TABLE [dbo].[GeolocalizacionInmueble] CHECK CONSTRAINT [FK_GeolocalizacionInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_HistorialRevision_Archivo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[HistorialRevision]  WITH CHECK ADD  CONSTRAINT [FK_HistorialRevision_Archivo] FOREIGN KEY([idCapturaAvaluo])
REFERENCES [dbo].[Archivo] ([idArchivo])
GO
ALTER TABLE [dbo].[HistorialRevision] CHECK CONSTRAINT [FK_HistorialRevision_Archivo]
GO
/****** Objeto:  ForeignKey [FK_HistorialRevision_RevisionAvaluo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[HistorialRevision]  WITH CHECK ADD  CONSTRAINT [FK_HistorialRevision_RevisionAvaluo] FOREIGN KEY([idRevision])
REFERENCES [dbo].[RevisionAvaluo] ([idRevision])
GO
ALTER TABLE [dbo].[HistorialRevision] CHECK CONSTRAINT [FK_HistorialRevision_RevisionAvaluo]
GO
/****** Objeto:  ForeignKey [FK_InfraestructuraInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[InfraestructuraInmueble]  WITH CHECK ADD  CONSTRAINT [FK_InfraestructuraInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InfraestructuraInmueble] CHECK CONSTRAINT [FK_InfraestructuraInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_Inmueble_DireccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_DireccionInmueble] FOREIGN KEY([idDireccionInmueble])
REFERENCES [dbo].[DireccionInmueble] ([idDireccionInmueble])
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_DireccionInmueble]
GO
/****** Objeto:  ForeignKey [FK_Inmueble_Propietario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_Propietario] FOREIGN KEY([idPropietario])
REFERENCES [dbo].[Propietario] ([idPropietario])
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_Propietario]
GO
/****** Objeto:  ForeignKey [FK_Inmueble_RegimenPropiedad]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_RegimenPropiedad] FOREIGN KEY([idRegimenPropiedad])
REFERENCES [dbo].[RegimenPropiedad] ([idRegimenPropiedad])
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_RegimenPropiedad]
GO
/****** Objeto:  ForeignKey [FK_Inmueble_TipoInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_TipoInmueble] FOREIGN KEY([idTipoInmueble])
REFERENCES [dbo].[TipoInmueble] ([idTipoInmueble])
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_TipoInmueble]
GO
/****** Objeto:  ForeignKey [FK_InstalacionConstruccion_ConstruccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[InstalacionConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_InstalacionConstruccion_ConstruccionInmueble] FOREIGN KEY([idConstruccion])
REFERENCES [dbo].[ConstruccionInmueble] ([idConstruccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstalacionConstruccion] CHECK CONSTRAINT [FK_InstalacionConstruccion_ConstruccionInmueble]
GO
/****** Objeto:  ForeignKey [FK_InstalacionesEspecialesCondominio_ConstruccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[InstalacionesEspecialesCondominio]  WITH CHECK ADD  CONSTRAINT [FK_InstalacionesEspecialesCondominio_ConstruccionInmueble] FOREIGN KEY([idConstruccion])
REFERENCES [dbo].[ConstruccionInmueble] ([idConstruccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstalacionesEspecialesCondominio] CHECK CONSTRAINT [FK_InstalacionesEspecialesCondominio_ConstruccionInmueble]
GO
/****** Objeto:  ForeignKey [FK_InstalacionesEspecialesConstruccion_ConstruccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[InstalacionesEspecialesConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_InstalacionesEspecialesConstruccion_ConstruccionInmueble] FOREIGN KEY([idConstruccion])
REFERENCES [dbo].[ConstruccionInmueble] ([idConstruccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstalacionesEspecialesConstruccion] CHECK CONSTRAINT [FK_InstalacionesEspecialesConstruccion_ConstruccionInmueble]
GO
/****** Objeto:  ForeignKey [FK_InstalacionesTipoConstruccion_TipoConstruccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[InstalacionesTipoConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_InstalacionesTipoConstruccion_TipoConstruccion] FOREIGN KEY([idConstruccion], [numeroTipo])
REFERENCES [dbo].[TipoConstruccion] ([idConstruccion], [numeroTipo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstalacionesTipoConstruccion] CHECK CONSTRAINT [FK_InstalacionesTipoConstruccion_TipoConstruccion]
GO
/****** Objeto:  ForeignKey [FK_Municipio_Estado]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Municipio]  WITH NOCHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([claveEstado])
REFERENCES [dbo].[Estado] ([claveEstado])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
/****** Objeto:  ForeignKey [FK_Personal_Usuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Usuario]
GO
/****** Objeto:  ForeignKey [FK_Propietario_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_Propietario_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_Propietario_Direccion]
GO
/****** Objeto:  ForeignKey [FK_RechazoAvaluo_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RechazoAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_RechazoAvaluo_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
GO
ALTER TABLE [dbo].[RechazoAvaluo] CHECK CONSTRAINT [FK_RechazoAvaluo_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_RechazoAvaluo_Personal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RechazoAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_RechazoAvaluo_Personal] FOREIGN KEY([idPersonal])
REFERENCES [dbo].[Personal] ([idPersonal])
GO
ALTER TABLE [dbo].[RechazoAvaluo] CHECK CONSTRAINT [FK_RechazoAvaluo_Personal]
GO
/****** Objeto:  ForeignKey [FK_RechazoAvaluo_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RechazoAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_RechazoAvaluo_Valuador] FOREIGN KEY([idControlador])
REFERENCES [dbo].[Valuador] ([idValuador])
GO
ALTER TABLE [dbo].[RechazoAvaluo] CHECK CONSTRAINT [FK_RechazoAvaluo_Valuador]
GO
/****** Objeto:  ForeignKey [FK_RegistroSHF_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RegistroSHF]  WITH CHECK ADD  CONSTRAINT [FK_RegistroSHF_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegistroSHF] CHECK CONSTRAINT [FK_RegistroSHF_Valuador]
GO
/****** Objeto:  ForeignKey [FK_RevisionAvaluo_AvaluoInmobiliario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RevisionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_RevisionAvaluo_AvaluoInmobiliario] FOREIGN KEY([idAvaluo])
REFERENCES [dbo].[AvaluoInmobiliario] ([idAvaluo])
GO
ALTER TABLE [dbo].[RevisionAvaluo] CHECK CONSTRAINT [FK_RevisionAvaluo_AvaluoInmobiliario]
GO
/****** Objeto:  ForeignKey [FK_RevisionAvaluo_Personal]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RevisionAvaluo]  WITH CHECK ADD  CONSTRAINT [FK_RevisionAvaluo_Personal] FOREIGN KEY([idPersonal])
REFERENCES [dbo].[Personal] ([idPersonal])
GO
ALTER TABLE [dbo].[RevisionAvaluo] CHECK CONSTRAINT [FK_RevisionAvaluo_Personal]
GO
/****** Objeto:  ForeignKey [FK_RolUsuario_RolSistema]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_RolSistema] FOREIGN KEY([idRol])
REFERENCES [dbo].[RolSistema] ([idRol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_RolSistema]
GO
/****** Objeto:  ForeignKey [FK_RolUsuario_Usuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Usuario]
GO
/****** Objeto:  ForeignKey [FK_ServiciosInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[ServiciosInmueble]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiciosInmueble] CHECK CONSTRAINT [FK_ServiciosInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_Solicitante_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[Solicitante]  WITH CHECK ADD  CONSTRAINT [FK_Solicitante_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Solicitante] CHECK CONSTRAINT [FK_Solicitante_Direccion]
GO
/****** Objeto:  ForeignKey [FK_SuperficiesInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[SuperficiesInmueble]  WITH CHECK ADD  CONSTRAINT [FK_SuperficiesInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuperficiesInmueble] CHECK CONSTRAINT [FK_SuperficiesInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoClasificacionZona_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[TipoClasificacionZona]  WITH CHECK ADD  CONSTRAINT [FK_TipoClasificacionZona_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoClasificacionZona] CHECK CONSTRAINT [FK_TipoClasificacionZona_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoConstruccion_ConstruccionInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[TipoConstruccion]  WITH CHECK ADD  CONSTRAINT [FK_TipoConstruccion_ConstruccionInmueble] FOREIGN KEY([idConstruccion])
REFERENCES [dbo].[ConstruccionInmueble] ([idConstruccion])
GO
ALTER TABLE [dbo].[TipoConstruccion] CHECK CONSTRAINT [FK_TipoConstruccion_ConstruccionInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoConstruccionPredominante_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[TipoConstruccionPredominante]  WITH CHECK ADD  CONSTRAINT [FK_TipoConstruccionPredominante_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoConstruccionPredominante] CHECK CONSTRAINT [FK_TipoConstruccionPredominante_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoCreditoInterno_EntidadFinanciamiento]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[TipoCreditoInterno]  WITH CHECK ADD  CONSTRAINT [FK_TipoCreditoInterno_EntidadFinanciamiento] FOREIGN KEY([idEntidad])
REFERENCES [dbo].[EntidadFinanciamiento] ([idEntidad])
GO
ALTER TABLE [dbo].[TipoCreditoInterno] CHECK CONSTRAINT [FK_TipoCreditoInterno_EntidadFinanciamiento]
GO
/****** Objeto:  ForeignKey [FK_TipoDensidad_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:02 ******/
ALTER TABLE [dbo].[TipoDensidad]  WITH CHECK ADD  CONSTRAINT [FK_TipoDensidad_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoDensidad] CHECK CONSTRAINT [FK_TipoDensidad_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoNivelSocioeconomico_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[TipoNivelSocioeconomico]  WITH CHECK ADD  CONSTRAINT [FK_TipoNivelSocioeconomico_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoNivelSocioeconomico] CHECK CONSTRAINT [FK_TipoNivelSocioeconomico_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoProximidadUrbana_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[TipoProximidadUrbana]  WITH CHECK ADD  CONSTRAINT [FK_TipoProximidadUrbana_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoProximidadUrbana] CHECK CONSTRAINT [FK_TipoProximidadUrbana_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_TipoUsoSuelo_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[TipoUsoSuelo]  WITH CHECK ADD  CONSTRAINT [FK_TipoUsoSuelo_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[TipoUsoSuelo] CHECK CONSTRAINT [FK_TipoUsoSuelo_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_UbicacionInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UbicacionInmueble]  WITH CHECK ADD  CONSTRAINT [FK_UbicacionInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UbicacionInmueble] CHECK CONSTRAINT [FK_UbicacionInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_UsoActualArea_UsoActualInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsoActualArea]  WITH CHECK ADD  CONSTRAINT [FK_UsoActualArea_UsoActualInmueble] FOREIGN KEY([idUsoActual])
REFERENCES [dbo].[UsoActualInmueble] ([idUsoActual])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsoActualArea] CHECK CONSTRAINT [FK_UsoActualArea_UsoActualInmueble]
GO
/****** Objeto:  ForeignKey [FK_UsoActualInmueble_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsoActualInmueble]  WITH CHECK ADD  CONSTRAINT [FK_UsoActualInmueble_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsoActualInmueble] CHECK CONSTRAINT [FK_UsoActualInmueble_Inmueble]
GO
/****** Objeto:  ForeignKey [FK_UsoActualRecamara_UsoActualInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsoActualRecamara]  WITH CHECK ADD  CONSTRAINT [FK_UsoActualRecamara_UsoActualInmueble] FOREIGN KEY([idUsoActual])
REFERENCES [dbo].[UsoActualInmueble] ([idUsoActual])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsoActualRecamara] CHECK CONSTRAINT [FK_UsoActualRecamara_UsoActualInmueble]
GO
/****** Objeto:  ForeignKey [FK_UsuarioCliente_Cliente]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsuarioCliente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCliente_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuarioCliente] CHECK CONSTRAINT [FK_UsuarioCliente_Cliente]
GO
/****** Objeto:  ForeignKey [FK_UsuarioCliente_Usuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsuarioCliente]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCliente_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuarioCliente] CHECK CONSTRAINT [FK_UsuarioCliente_Usuario]
GO
/****** Objeto:  ForeignKey [FK_UsuarioValuador_Usuario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsuarioValuador]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioValuador_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuarioValuador] CHECK CONSTRAINT [FK_UsuarioValuador_Usuario]
GO
/****** Objeto:  ForeignKey [FK_UsuarioValuador_Valuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[UsuarioValuador]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioValuador_Valuador] FOREIGN KEY([idValuador])
REFERENCES [dbo].[Valuador] ([idValuador])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuarioValuador] CHECK CONSTRAINT [FK_UsuarioValuador_Valuador]
GO
/****** Objeto:  ForeignKey [FK_ValorMaterial_ClaseInmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[ValorMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ValorMaterial_ClaseInmueble] FOREIGN KEY([idClase])
REFERENCES [dbo].[ClaseInmueble] ([idClase])
GO
ALTER TABLE [dbo].[ValorMaterial] CHECK CONSTRAINT [FK_ValorMaterial_ClaseInmueble]
GO
/****** Objeto:  ForeignKey [FK_ValorMaterial_TipoMaterial]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[ValorMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ValorMaterial_TipoMaterial] FOREIGN KEY([idTipoMaterial])
REFERENCES [dbo].[TipoMaterial] ([idTipoMaterial])
GO
ALTER TABLE [dbo].[ValorMaterial] CHECK CONSTRAINT [FK_ValorMaterial_TipoMaterial]
GO
/****** Objeto:  ForeignKey [FK_valorServicio_tipoServicio]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[ValorServicio]  WITH CHECK ADD  CONSTRAINT [FK_valorServicio_tipoServicio] FOREIGN KEY([idTipoServicio])
REFERENCES [dbo].[TipoServicio] ([idTipoServicio])
GO
ALTER TABLE [dbo].[ValorServicio] CHECK CONSTRAINT [FK_valorServicio_tipoServicio]
GO
/****** Objeto:  ForeignKey [FK_Valuador_Archivo]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_Archivo] FOREIGN KEY([idFotografia])
REFERENCES [dbo].[Archivo] ([idArchivo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_Archivo]
GO
/****** Objeto:  ForeignKey [FK_Valuador_DatoBancario]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_DatoBancario] FOREIGN KEY([idDatoBancario])
REFERENCES [dbo].[DatoBancario] ([idDatoBancario])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_DatoBancario]
GO
/****** Objeto:  ForeignKey [FK_Valuador_DatoContacto]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_DatoContacto] FOREIGN KEY([idDatoContacto])
REFERENCES [dbo].[DatoContacto] ([idDatoContacto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_DatoContacto]
GO
/****** Objeto:  ForeignKey [FK_Valuador_DatoPaqueteriaValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_DatoPaqueteriaValuador] FOREIGN KEY([idDatoPaqueteria])
REFERENCES [dbo].[DatoPaqueteria] ([idDatoPaqueteria])
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_DatoPaqueteriaValuador]
GO
/****** Objeto:  ForeignKey [FK_Valuador_Direccion]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_Direccion]
GO
/****** Objeto:  ForeignKey [FK_Valuador_FormacionValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_FormacionValuador] FOREIGN KEY([idFormacionValuacion])
REFERENCES [dbo].[FormacionValuador] ([idFormacionValuador])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_FormacionValuador]
GO
/****** Objeto:  ForeignKey [FK_Valuador_TipoValuador]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[Valuador]  WITH CHECK ADD  CONSTRAINT [FK_Valuador_TipoValuador] FOREIGN KEY([idTipoValuador])
REFERENCES [dbo].[TipoValuador] ([idTipoValuador])
GO
ALTER TABLE [dbo].[Valuador] CHECK CONSTRAINT [FK_Valuador_TipoValuador]
GO
/****** Objeto:  ForeignKey [FK_ViasAcceso_Inmueble]    Fecha de la secuencia de comandos: 02/10/2009 21:14:03 ******/
ALTER TABLE [dbo].[ViasAcceso]  WITH CHECK ADD  CONSTRAINT [FK_ViasAcceso_Inmueble] FOREIGN KEY([idInmueble])
REFERENCES [dbo].[Inmueble] ([idInmueble])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ViasAcceso] CHECK CONSTRAINT [FK_ViasAcceso_Inmueble]
GO
