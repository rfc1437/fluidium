//  Copyright 2009 Todd Ditchendorf
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "FUUserstyleViewController.h"
#import "FUUserstyleController.h"

@implementation FUUserstyleViewController

- (void)loadUserthings {
    self.userthings = [[FUUserstyleController instance] userstyles];
}


- (void)storeUserthings {
    [[FUUserstyleController instance] save];
}


- (void)setUserthings:(NSMutableArray *)new {
    NSMutableArray *old = userthings;
    
    if (old != new) {
        for (id rule in old) {
            [self stopObservingRule:rule];
        }
        
        [old autorelease];
        userthings = [new retain];
        [[FUUserstyleController instance] setUserstyles:new];
        
        for (id rule in new) {
            [self startObservingRule:rule];
        }
    }
}

@end
