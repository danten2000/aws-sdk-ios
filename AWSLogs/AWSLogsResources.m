//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSLogsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLogsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLogsResources

+ (instancetype)sharedInstance {
    static AWSLogsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLogsResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2014-03-28\",\
    \"endpointPrefix\":\"logs\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon CloudWatch Logs\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Logs_20140328\",\
    \"uid\":\"logs-2014-03-28\"\
  },\
  \"operations\":{\
    \"CancelExportTask\":{\
      \"name\":\"CancelExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelExportTaskRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Cancels the specified export task.</p> <p>The task must be in the <code>PENDING</code> or <code>RUNNING</code> state.</p>\"\
    },\
    \"CreateExportTask\":{\
      \"name\":\"CreateExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateExportTaskRequest\"},\
      \"output\":{\"shape\":\"CreateExportTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates an export task, which allows you to efficiently export data from a log group to an Amazon S3 bucket.</p> <p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a>DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a>CancelExportTask</a>.</p> <p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate out log data for each export task, you can specify a prefix that will be used as the Amazon S3 key prefix for all exported objects.</p>\"\
    },\
    \"CreateLogGroup\":{\
      \"name\":\"CreateLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log group with the specified name.</p> <p>You can create up to 5000 log groups per account.</p> <p>You must use the following guidelines when naming a log group:</p> <ul> <li> <p>Log group names must be unique within a region for an AWS account.</p> </li> <li> <p>Log group names can be between 1 and 512 characters long.</p> </li> <li> <p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), and '.' (period).</p> </li> </ul>\"\
    },\
    \"CreateLogStream\":{\
      \"name\":\"CreateLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log stream for the specified log group.</p> <p>There is no limit on the number of log streams that you can create for a log group.</p> <p>You must use the following guidelines when naming a log stream:</p> <ul> <li> <p>Log stream names must be unique within the log group.</p> </li> <li> <p>Log stream names can be between 1 and 512 characters long.</p> </li> <li> <p>The ':' (colon) and '*' (asterisk) characters are not allowed.</p> </li> </ul>\"\
    },\
    \"DeleteDestination\":{\
      \"name\":\"DeleteDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDestinationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified destination, and eventually disables all the subscription filters that publish to it. This operation does not delete the physical resource encapsulated by the destination.</p>\"\
    },\
    \"DeleteLogGroup\":{\
      \"name\":\"DeleteLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log group and permanently deletes all the archived log events associated with the log group.</p>\"\
    },\
    \"DeleteLogStream\":{\
      \"name\":\"DeleteLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.</p>\"\
    },\
    \"DeleteMetricFilter\":{\
      \"name\":\"DeleteMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified metric filter.</p>\"\
    },\
    \"DeleteRetentionPolicy\":{\
      \"name\":\"DeleteRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified retention policy.</p> <p>Log events do not expire if they belong to log groups without a retention policy.</p>\"\
    },\
    \"DeleteSubscriptionFilter\":{\
      \"name\":\"DeleteSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified subscription filter.</p>\"\
    },\
    \"DescribeDestinations\":{\
      \"name\":\"DescribeDestinations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDestinationsRequest\"},\
      \"output\":{\"shape\":\"DescribeDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists all your destinations. The results are ASCII-sorted by destination name.</p>\"\
    },\
    \"DescribeExportTasks\":{\
      \"name\":\"DescribeExportTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeExportTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeExportTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified export tasks. You can list all your export tasks or filter the results based on task ID or task status.</p>\"\
    },\
    \"DescribeLogGroups\":{\
      \"name\":\"DescribeLogGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p>\"\
    },\
    \"DescribeLogStreams\":{\
      \"name\":\"DescribeLogStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogStreamsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogStreamsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p> <p>This operation has a limit of five transactions per second, after which transactions are throttled.</p>\"\
    },\
    \"DescribeMetricFilters\":{\
      \"name\":\"DescribeMetricFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeMetricFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeMetricFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified metric filters. You can list all the metric filters or filter the results by log name, prefix, metric name, and metric namespace. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"DescribeSubscriptionFilters\":{\
      \"name\":\"DescribeSubscriptionFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSubscriptionFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeSubscriptionFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the subscription filters for the specified log group. You can list all the subscription filters or filter the results by prefix. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"FilterLogEvents\":{\
      \"name\":\"FilterLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"FilterLogEventsRequest\"},\
      \"output\":{\"shape\":\"FilterLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p> <p>By default, this operation returns as many log events as can fit in 1MB (up to 10,000 log events), or all the events found within the time range that you specify. If the results include a token, then there are more log events available, and you can get additional results by specifying the token in a subsequent call.</p>\"\
    },\
    \"GetLogEvents\":{\
      \"name\":\"GetLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogEventsRequest\"},\
      \"output\":{\"shape\":\"GetLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log stream. You can list all the log events or filter using a time range.</p> <p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). If the results include tokens, there are more log events available. You can get additional log events by specifying one of the tokens in a subsequent call.</p>\"\
    },\
    \"ListTagsLogGroup\":{\
      \"name\":\"ListTagsLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsLogGroupRequest\"},\
      \"output\":{\"shape\":\"ListTagsLogGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags for the specified log group.</p> <p>To add tags, use <a>TagLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p>\"\
    },\
    \"PutDestination\":{\
      \"name\":\"PutDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationRequest\"},\
      \"output\":{\"shape\":\"PutDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a destination. A destination encapsulates a physical resource (such as a Kinesis stream) and enables you to subscribe to a real-time stream of log events of a different account, ingested using <a>PutLogEvents</a>. Currently, the only supported physical resource is a Amazon Kinesis stream belonging to the same account as the destination.</p> <p>A destination controls what is written to its Amazon Kinesis stream through an access policy. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a>PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a>PutDestinationPolicy</a> after <code>PutDestination</code>.</p>\"\
    },\
    \"PutDestinationPolicy\":{\
      \"name\":\"PutDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href=\\\"http://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html\\\">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>\"\
    },\
    \"PutLogEvents\":{\
      \"name\":\"PutLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutLogEventsRequest\"},\
      \"output\":{\"shape\":\"PutLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidSequenceTokenException\"},\
        {\"shape\":\"DataAlreadyAcceptedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Uploads a batch of log events to the specified log stream.</p> <p>You must include the sequence token obtained from the response of the previous call. An upload in a newly created log stream does not require a sequence token. You can also get the sequence token using <a>DescribeLogStreams</a>.</p> <p>The batch of events must satisfy the following constraints:</p> <ul> <li> <p>The maximum batch size is 1,048,576 bytes, and this size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p> </li> <li> <p>None of the log events in the batch can be more than 2 hours in the future.</p> </li> <li> <p>None of the log events in the batch can be older than 14 days or the retention period of the log group.</p> </li> <li> <p>The log events in the batch must be in chronological ordered by their timestamp (the time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC).</p> </li> <li> <p>The maximum number of log events in a batch is 10,000.</p> </li> <li> <p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p> </li> </ul>\"\
    },\
    \"PutMetricFilter\":{\
      \"name\":\"PutMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a metric filter and associates it with the specified log group. Metric filters allow you to configure rules to extract metric data from log events ingested through <a>PutLogEvents</a>.</p> <p>The maximum number of metric filters that can be associated with a log group is 100.</p>\"\
    },\
    \"PutRetentionPolicy\":{\
      \"name\":\"PutRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the retention of the specified log group. A retention policy allows you to configure the number of days you want to retain log events in the specified log group.</p>\"\
    },\
    \"PutSubscriptionFilter\":{\
      \"name\":\"PutSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a subscription filter and associates it with the specified log group. Subscription filters allow you to subscribe to a real-time stream of log events ingested through <a>PutLogEvents</a> and have them delivered to a specific destination. Currently, the supported destinations are:</p> <ul> <li> <p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination that belongs to a different account, for cross-account delivery.</p> </li> <li> <p>An Amazon Kinesis Firehose stream that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>An AWS Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> </ul> <p>There can only be one subscription filter associated with a log group.</p>\"\
    },\
    \"TagLogGroup\":{\
      \"name\":\"TagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<p>Adds or updates the specified tags for the specified log group.</p> <p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To remove tags, use <a>UntagLogGroup</a>.</p> <p>For more information about tags, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html\\\">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p>\"\
    },\
    \"TestMetricFilter\":{\
      \"name\":\"TestMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestMetricFilterRequest\"},\
      \"output\":{\"shape\":\"TestMetricFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Tests the filter pattern of a metric filter against a sample of log event messages. You can use this operation to validate the correctness of a metric filter pattern.</p>\"\
    },\
    \"UntagLogGroup\":{\
      \"name\":\"UntagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified log group.</p> <p>To list the tags for a log group, use <a>ListTagsLogGroup</a>. To add tags, use <a>UntagLogGroup</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessPolicy\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Arn\":{\"type\":\"string\"},\
    \"CancelExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"from\",\
        \"to\",\
        \"destination\"\
      ],\
      \"members\":{\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>Export only log streams that match the provided prefix. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time of the range for the request, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp earlier than this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time of the range for the request, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp later than this time are not exported.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of S3 bucket for the exported log data. The bucket must be in the same AWS region.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix used as the start of the key for every object exported. If you don't specify a value, the default is <code>exportedlogs</code>.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"CreateLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p>\"\
        }\
      }\
    },\
    \"CreateLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DataAlreadyAcceptedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The event was already logged.</p>\",\
      \"exception\":true\
    },\
    \"Days\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653.</p>\"\
    },\
    \"DefaultValue\":{\"type\":\"double\"},\
    \"DeleteDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"destinationName\"],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        }\
      }\
    },\
    \"DeleteLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DeleteMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        }\
      }\
    },\
    \"DeleteRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        }\
      }\
    },\
    \"Descending\":{\"type\":\"boolean\"},\
    \"DescribeDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DestinationNamePrefix\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinations\":{\
          \"shape\":\"Destinations\",\
          \"documentation\":\"<p>The destinations.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeExportTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task. Specifying a task ID filters the results to zero or one export tasks.</p>\"\
        },\
        \"statusCode\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task. Specifying a status code filters the results to zero or more export tasks.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeExportTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"exportTasks\":{\
          \"shape\":\"ExportTasks\",\
          \"documentation\":\"<p>The export tasks.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"DescribeLogGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupNamePrefix\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The prefix to match.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeLogGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroups\":{\
          \"shape\":\"LogGroups\",\
          \"documentation\":\"<p>The log groups.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLogStreamsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The prefix to match.</p> <p>You cannot specify this parameter if <code>orderBy</code> is <code>LastEventTime</code>.</p>\"\
        },\
        \"orderBy\":{\
          \"shape\":\"OrderBy\",\
          \"documentation\":\"<p>If the value is <code>LogStreamName</code>, the results are ordered by log stream name. If the value is <code>LastEventTime</code>, the results are ordered by the event time. The default value is <code>LogStreamName</code>.</p> <p>If you order the results by event time, you cannot specify the <code>logStreamNamePrefix</code> parameter.</p>\"\
        },\
        \"descending\":{\
          \"shape\":\"Descending\",\
          \"documentation\":\"<p>If the value is true, results are returned in descending order. If the value is to false, results are returned in ascending order. The default value is false.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeLogStreamsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreams\":{\
          \"shape\":\"LogStreams\",\
          \"documentation\":\"<p>The log streams.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeMetricFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The namespace of the CloudWatch metric.</p>\"\
        }\
      }\
    },\
    \"DescribeMetricFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricFilters\":{\
          \"shape\":\"MetricFilters\",\
          \"documentation\":\"<p>The metric filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeSubscriptionFiltersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeSubscriptionFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"subscriptionFilters\":{\
          \"shape\":\"SubscriptionFilters\",\
          \"documentation\":\"<p>The subscription filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the physical target where the log events will be delivered (for example, a Kinesis stream).</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>A role for impersonation, used when delivering log events to the target.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that governs which AWS accounts can create subscription filters against this destination.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of this destination.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a cross-account destination that receives subscription log events.</p>\"\
    },\
    \"DestinationArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"DestinationName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"Destinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Destination\"}\
    },\
    \"Distribution\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Random\",\
        \"ByLogStream\"\
      ]\
    },\
    \"EventId\":{\"type\":\"string\"},\
    \"EventMessage\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"EventNumber\":{\"type\":\"long\"},\
    \"EventsLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"ExportDestinationBucket\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportDestinationPrefix\":{\"type\":\"string\"},\
    \"ExportTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        },\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group from which logs data was exported.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp prior to this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp later than this time are not exported.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of Amazon S3 bucket to which the log data was exported.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix that was used as the start of Amazon S3 key for every object exported.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ExportTaskStatus\",\
          \"documentation\":\"<p>The status of the export task.</p>\"\
        },\
        \"executionInfo\":{\
          \"shape\":\"ExportTaskExecutionInfo\",\
          \"documentation\":\"<p>Execution info about the export task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an export task.</p>\"\
    },\
    \"ExportTaskExecutionInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the export task.</p>\"\
        },\
        \"completionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The completion time of the export task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskId\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ExportTaskStatusMessage\",\
          \"documentation\":\"<p>The status message related to the status code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskStatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CANCELLED\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"PENDING\",\
        \"PENDING_CANCEL\",\
        \"RUNNING\"\
      ]\
    },\
    \"ExportTaskStatusMessage\":{\"type\":\"string\"},\
    \"ExportTasks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExportTask\"}\
    },\
    \"ExtractedValues\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Token\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"FilterCount\":{\"type\":\"integer\"},\
    \"FilterLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamNames\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>Optional list of log stream names.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp prior to this time are not returned.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp later than this time are not returned.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>The filter pattern to use. If not provided, all the events are matched.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of events to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of events to return. The default is 10,000 events.</p>\"\
        },\
        \"interleaved\":{\
          \"shape\":\"Interleaved\",\
          \"documentation\":\"<p>If the value is true, the operation makes a best effort to provide responses that contain events from multiple log streams within the log group interleaved in a single response. If the value is false all the matched log events in the first log stream are searched first, then those in the next log stream, and so on. The default is false.</p>\"\
        }\
      }\
    },\
    \"FilterLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"FilteredLogEvents\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        },\
        \"searchedLogStreams\":{\
          \"shape\":\"SearchedLogStreams\",\
          \"documentation\":\"<p>Indicates which log streams have been searched and whether each has been searched completely.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. The token expires after 24 hours.</p>\"\
        }\
      }\
    },\
    \"FilterName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"FilterPattern\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event may contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"FilteredLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream this event belongs to.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested.</p>\"\
        },\
        \"eventId\":{\
          \"shape\":\"EventId\",\
          \"documentation\":\"<p>The ID of the event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"FilteredLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilteredLogEvent\"}\
    },\
    \"GetLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp earlier than this time are not included.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC. Events with a timestamp later than this time are not included.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of log events returned. If you don't specify a value, the maximum is as many log events as can fit in a response size of 1MB, up to 10,000 log events.</p>\"\
        },\
        \"startFromHead\":{\
          \"shape\":\"StartFromHead\",\
          \"documentation\":\"<p>If the value is true, the earliest log events are returned first. If the value is false, the latest log events are returned first. The default value is false.</p>\"\
        }\
      }\
    },\
    \"GetLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"OutputLogEvents\",\
          \"documentation\":\"<p>The events.</p>\"\
        },\
        \"nextForwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the forward direction. The token expires after 24 hours.</p>\"\
        },\
        \"nextBackwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the backward direction. The token expires after 24 hours.</p>\"\
        }\
      }\
    },\
    \"InputLogEvent\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"timestamp\",\
        \"message\"\
      ],\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event, which is a record of activity that was recorded by the application or resource being monitored.</p>\"\
    },\
    \"InputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InputLogEvent\"},\
      \"max\":10000,\
      \"min\":1\
    },\
    \"InputLogStreamNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStreamName\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Interleaved\":{\"type\":\"boolean\"},\
    \"InvalidOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The operation is not valid on the specified resource.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A parameter is specified incorrectly.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSequenceTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The sequence token is not valid.</p>\",\
      \"exception\":true\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You have reached the maximum number of resources that can be created.</p>\",\
      \"exception\":true\
    },\
    \"ListTagsLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"ListTagsLogGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      }\
    },\
    \"LogEventIndex\":{\"type\":\"integer\"},\
    \"LogGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the log group.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"},\
        \"metricFilterCount\":{\
          \"shape\":\"FilterCount\",\
          \"documentation\":\"<p>The number of metric filters.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log group.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log group.</p>\"\
    },\
    \"LogGroupName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]+\"\
    },\
    \"LogGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroup\"}\
    },\
    \"LogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the stream.</p>\"\
        },\
        \"firstEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the first event, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"lastEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the last event, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"lastIngestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The ingestion time.</p>\"\
        },\
        \"uploadSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log stream.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log stream, which is a sequence of log events from a single emitter of logs.</p>\"\
    },\
    \"LogStreamName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"LogStreamSearchedCompletely\":{\"type\":\"boolean\"},\
    \"LogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStream\"}\
    },\
    \"MetricFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>The metric transformations.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the metric filter.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metric filters express how CloudWatch Logs would extract metric observations from ingested log events and transform them into metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricFilterMatchRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"eventNumber\":{\
          \"shape\":\"EventNumber\",\
          \"documentation\":\"<p>The event number.</p>\"\
        },\
        \"eventMessage\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event data.</p>\"\
        },\
        \"extractedValues\":{\
          \"shape\":\"ExtractedValues\",\
          \"documentation\":\"<p>The values extracted from the event data by the filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"MetricFilterMatches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilterMatchRecord\"}\
    },\
    \"MetricFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilter\"}\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of the CloudWatch metric to which the monitored log information should be published. For example, you may publish to a metric called ErrorCount.</p>\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricNamespace\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricTransformation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"metricNamespace\",\
        \"metricValue\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The namespace of the CloudWatch metric.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value to publish to the CloudWatch metric when a filter pattern matches a log event.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"DefaultValue\",\
          \"documentation\":\"<p>(Optional) The value to emit when a filter pattern does not match a log event. This value can be null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates how to transform ingested log events into metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricTransformations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricTransformation\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"MetricValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The value to publish to the CloudWatch metric. For example, if you're counting the occurrences of a term like \\\"Error\\\", the value is \\\"1\\\" for each occurrence. If you're counting the bytes transferred, the value is the value in the log event.</p>\",\
      \"max\":100\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The token for the next set of items to return. The token expires after 24 hours.</p>\",\
      \"min\":1\
    },\
    \"OperationAbortedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Multiple requests to update the same resource were in conflict.</p>\",\
      \"exception\":true\
    },\
    \"OrderBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LogStreamName\",\
        \"LastEventTime\"\
      ]\
    },\
    \"OutputLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event.</p>\"\
    },\
    \"OutputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutputLogEvent\"}\
    },\
    \"PutDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"accessPolicy\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for an existing destination.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that authorizes cross-account users to deliver their log events to the associated destination.</p>\"\
        }\
      }\
    },\
    \"PutDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"targetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The ARN of an Amazon Kinesis stream to deliver matching log events to.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to call Amazon Kinesis PutRecord on the destination stream.</p>\"\
        }\
      }\
    },\
    \"PutDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The destination.</p>\"\
        }\
      }\
    },\
    \"PutLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\",\
        \"logEvents\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"logEvents\":{\
          \"shape\":\"InputLogEvents\",\
          \"documentation\":\"<p>The log events.</p>\"\
        },\
        \"sequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token.</p>\"\
        }\
      }\
    },\
    \"PutLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The next sequence token.</p>\"\
        },\
        \"rejectedLogEventsInfo\":{\
          \"shape\":\"RejectedLogEventsInfo\",\
          \"documentation\":\"<p>The rejected events.</p>\"\
        }\
      }\
    },\
    \"PutMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"metricTransformations\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the metric filter.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for extracting metric data out of ingested log events.</p>\"\
        },\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>A collection of information needed to define how metric data gets emitted.</p>\"\
        }\
      }\
    },\
    \"PutRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"retentionInDays\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"}\
      }\
    },\
    \"PutSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"destinationArn\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the subscription filter.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for subscribing to a filtered stream of log events.</p>\"\
        },\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The ARN of the destination to deliver matching log events to. Currently, the supported destinations are:</p> <ul> <li> <p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination (specified using an ARN) belonging to a different account, for cross-account delivery.</p> </li> <li> <p>An Amazon Kinesis Firehose stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>An AWS Lambda function belonging to the same account as the subscription filter, for same-account delivery.</p> </li> </ul>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery.</p>\"\
        },\
        \"distribution\":{\
          \"shape\":\"Distribution\",\
          \"documentation\":\"<p>The method used to distribute log data to the destination, when the destination is an Amazon Kinesis stream. By default, log data is grouped by log stream. For a more even distribution, you can group log data randomly.</p>\"\
        }\
      }\
    },\
    \"RejectedLogEventsInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tooNewLogEventStartIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The log events that are too new.</p>\"\
        },\
        \"tooOldLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The log events that are too old.</p>\"\
        },\
        \"expiredLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The expired log events.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the rejected events.</p>\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"SearchedLogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"searchedCompletely\":{\
          \"shape\":\"LogStreamSearchedCompletely\",\
          \"documentation\":\"<p>Indicates whether all the events in this log stream were searched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the search status of a log stream.</p>\"\
    },\
    \"SearchedLogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchedLogStream\"}\
    },\
    \"SequenceToken\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The service cannot complete the request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"StartFromHead\":{\"type\":\"boolean\"},\
    \"StoredBytes\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"SubscriptionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the destination.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p/>\"\
        },\
        \"distribution\":{\
          \"shape\":\"Distribution\",\
          \"documentation\":\"<p>The method used to distribute log data to the destination, when the destination is an Amazon Kinesis stream.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the subscription filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a subscription filter.</p>\"\
    },\
    \"SubscriptionFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubscriptionFilter\"}\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]+)$\"\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"min\":1\
    },\
    \"TagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TargetArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TestEventMessages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventMessage\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TestMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"filterPattern\",\
        \"logEventMessages\"\
      ],\
      \"members\":{\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"logEventMessages\":{\
          \"shape\":\"TestEventMessages\",\
          \"documentation\":\"<p>The log event messages to test.</p>\"\
        }\
      }\
    },\
    \"TestMetricFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"matches\":{\
          \"shape\":\"MetricFilterMatches\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        }\
      }\
    },\
    \"Timestamp\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"Token\":{\"type\":\"string\"},\
    \"UntagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys. The corresponding tags are removed from the log group.</p>\"\
        }\
      }\
    },\
    \"Value\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from EC2 instances, Amazon CloudTrail, or other sources. You can then retrieve the associated log data from CloudWatch Logs using the Amazon CloudWatch console, the CloudWatch Logs commands in the AWS CLI, the CloudWatch Logs API, or the CloudWatch Logs SDK.</p> <p>You can use CloudWatch Logs to:</p> <ul> <li> <p> <b>Monitor Logs from Amazon EC2 Instances in Real-time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs and send you a notification whenever the rate of errors exceeds a threshold you specify. CloudWatch Logs uses your log data for monitoring; so, no code changes are required. For example, you can monitor application logs for specific literal terms (such as \\\"NullReferenceException\\\") or count the number of occurrences of a literal term at a particular position in log data (such as \\\"404\\\" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a Amazon CloudWatch metric that you specify.</p> </li> <li> <p> <b>Monitor Amazon CloudTrail Logged Events</b>: You can create alarms in Amazon CloudWatch and receive notifications of particular API activity as captured by CloudTrail and use the notification to perform troubleshooting.</p> </li> <li> <p> <b>Archive Log Data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events older than this setting are automatically deleted. The CloudWatch Logs agent makes it easy to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p> </li> </ul>\"\
}\
";
}

@end
