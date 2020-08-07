// Get ContentDocumentId

ContentDocumentLink cdl = [
  SELECT Id, ContentDocumentId
  FROM ContentDocumentLink
  WHERE LinkedEntityId = '123456789012345678'
];

// Get Content VersionData

ContentVersion cv = [
  SELECT Id, ContentSize, ContentDocumentId, VersionData
  FROM ContentVersion
  WHERE ContentDocumentId = :cdl.ContentDocumentId
];

// Parse as String
String csvString = cv.VersionData.tostring();

// Parse as List
List<List<String>> data = RT_CSVReader.read(csvString);

System.debug('Wow how many rows? ' + data.size());

for (List<String> row : data){
  System.debug('Here it is each '+row);
}
