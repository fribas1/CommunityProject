using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

namespace CommWebApp
{
    public static class BlobStorageHelper
    {
        private static CloudBlobContainer GetContainerReference(string containerName)
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("CloudConnection"));

            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            return blobClient.GetContainerReference(containerName);
        }

        private static CloudBlockBlob GetBlockBlobReference(string containerName, string blobName)
        {
            CloudBlobContainer container = GetContainerReference(containerName);

            return container.GetBlockBlobReference(blobName);
        }

        public static void CheckContainer(string containerName)
        {
            CloudBlobContainer container = GetContainerReference(containerName);

            container.CreateIfNotExists();
        }

        public static void UploadBlockBlob(string containerName, string blobName, string fileName)
        {
            CloudBlockBlob blob = GetBlockBlobReference(containerName, blobName);
            blob.UploadFromFile(fileName);
        }
    }
}