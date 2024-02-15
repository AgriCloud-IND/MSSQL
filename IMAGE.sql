CREATE TABLE Images (
    ImageID INT PRIMARY KEY IDENTITY,
    ImageName NVARCHAR(100),
    ImageData VARBINARY(MAX)
);

Insert Image Data: 
  DECLARE @ImageData VARBINARY(MAX);
  SELECT @ImageData = BulkColumn 
  FROM OPENROWSET(BULK 'C:\Path\To\Your\Image.jpg', SINGLE_BLOB) AS img;
  
  INSERT INTO Images (ImageName, ImageData)
  VALUES ('YourImage.jpg', @ImageData);

Create the Stored Procedure:
  CREATE PROCEDURE InsertImage
      @ImageFileName NVARCHAR(255)
  AS
  BEGIN
      DECLARE @SQL NVARCHAR(MAX);
      SET @SQL = N'
          DECLARE @ImageData VARBINARY(MAX);
          SELECT @ImageData = BulkColumn 
          FROM OPENROWSET(BULK ''' + @ImageFileName + ''', SINGLE_BLOB) AS img;
  
          INSERT INTO Images (ImageName, ImageData)
          VALUES (@ImageFileName, @ImageData);
      ';
  
      EXEC sp_executesql @SQL, N'@ImageFileName NVARCHAR(255)', @ImageFileName;
  END;

-- EXEC InsertImage @ImageFileName = 'C:\Path\To\Your\Image.jpg';


--Retrive Image Data as Base64 - 
   
    DECLARE @ImageData VARBINARY(MAX);
    
    SELECT @ImageData = ImageData
    FROM Images
    WHERE ImageID = 1; -- Replace 1 with the desired ImageID
    
    DECLARE @Base64String VARCHAR(MAX);
    SET @Base64String = (SELECT CAST(N'' AS XML).value('xs:base64Binary(sql:variable("@ImageData"))', 'VARCHAR(MAX)'))
    
    DECLARE @XML XML = CAST('<image>' + @Base64String + '</image>' AS XML);
    
    SELECT @XML AS Base64ImageData;

/*
Display Image Data in HTML - 
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Base64 Image Example</title>
  </head>
  <body>
      <h1>Base64 Image Example</h1>
      <img src="data:image/png;base64, YOUR_BASE64_ENCODED_IMAGE_DATA" alt="Image">
  </body>
  </html>
*/
--Example - <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/" alt="Image">

