USE [MyProjectsOrganizer_db]
GO

IF EXISTS (
        SELECT type_desc, type
        FROM sys.procedures WITH(NOLOCK)
        WHERE NAME = 'Properties_StoredProcedures'
            AND type = 'P'
      )
     DROP PROCEDURE dbo.Properties_StoredProcedures
GO


CREATE PROCEDURE Properties_StoredProcedures (	@PropertyId INTEGER,
												@PropertyName NVARCHAR (50),
												@DataType NVARCHAR (10),
												@AccessModifier NVARCHAR (10),
												@Description NVARCHAR (255),
												@ModelId INTEGER, 
												@Process NVARCHAR(50)='')
AS
	BEGIN
		
		IF @Process = 'CreateProperty'
			BEGIN 
				INSERT INTO Properties (Property_Name, Data_Type, Access_Modifier, Description, Model_Id)
				VALUES (@PropertyName, @DataType, @AccessModifier, @Description, @ModelId)
			END

		ELSE IF @Process = 'UpdateProperty'
			BEGIN 
				UPDATE Properties SET Property_Name=@PropertyName, Data_Type=@DataType, Access_Modifier=@AccessModifier,
				Description=@Description
				WHERE Property_Id=@PropertyId
			END

		ELSE IF @Process = 'GetPropertyById'
			BEGIN
				SELECT * FROM Properties WHERE Property_Id=@PropertyId
			END

		ELSE IF @Process = 'GetPropertiesByModelId'
			BEGIN
				SELECT * FROM Properties WHERE Model_Id=@ModelId
			END

		ELSE IF @Process = 'DeleteProperty'
			BEGIN 
				DELETE FROM Properties WHERE Property_Id=@PropertyId
			END

		ELSE IF @Process = 'GetLatestProperty'
			BEGIN
				SELECT TOP 1 * FROM Properties WHERE Model_Id = @ModelId 
				ORDER BY Property_Id DESC
			END
	END
GO
