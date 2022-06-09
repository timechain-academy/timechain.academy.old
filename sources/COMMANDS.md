# NOTE                                                                 docker doesnt like names with dots
# Use $(GIT_REPO_NAME) for commands that need the dotted name
# $(PROJECT_NAME) is used in many docker commands in the GNUmakefile
# make docs private=true
# NOTE                                                                 We use the dotted name for some commands
# ie. ghp-import -c $(GIT_REPO_NAME) in make push-docs
#      Mark 305
# help                                                                print help
# 	test
# 		test
# 			test
# 				test
# 	test                                                                test
# 		test                                                                test
# 			test                                                                test
# 				test                                                                test
# 	test                                                                	test
# 		test                                                                		test
# 			test                                                                			test
# 				test                                                                				test
# else
## help  print help
## 	test
## 		test
## 			test
## 				test
## 	test  test
## 		test  test
## 			test  test
## 				test  test
## 	test  	test
## 		test  		test
## 			test  			test
## 				test  				test
### help  print help
### 	test
### 		test
### 			test
### 				test
### 	test  test
### 		test  test
### 			test  test
### 				test  test
### 	test  	test
### 		test  		test
### 			test  			test
### 				test  				test
