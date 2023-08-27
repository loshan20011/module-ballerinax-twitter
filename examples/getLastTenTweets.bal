// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerinax/twitter;

configurable string apiKey = ?;
configurable string apiSecret = ?;
configurable string accessToken = ?;
configurable string accessTokenSecret = ?;

public function main() returns error? {

    // Add the Twitter credentials as the Configuration
    twitter:ConnectionConfig configuration = {
        apiKey: apiKey,
        apiSecret: apiSecret,
        accessToken: accessToken,
        accessTokenSecret: accessTokenSecret
    };

    twitter:Client twitterClient = check new (configuration);

    twitter:Tweet[] response = check twitterClient->getLast10Tweets();
    foreach twitter:Tweet tweet in response {
        log:printInfo(tweet.toString());
    }
}