// Get ContentDocumentId

ContentDocumentLink cdl = [
  SELECT Id, ContentDocumentId
  FROM ContentDocumentLink
  WHERE LinkedEntityId = 'a002500000B77AMAAZ'
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

System.debug('Wow is that my data parsed? ' + data.size());
