class UserSubscription {
	String? userSubscriptionId;
	String? subscriptionId;
	String? subscriptionName;
	String? userId;
	String? active;
	String? startDate;
	String? endDate;
	

  

	UserSubscription({this.userSubscriptionId, 
  this.subscriptionId, this.subscriptionName, 
  this.userId, this.active, this.startDate, this.endDate
  
  });

	UserSubscription.fromJson(Map<String, dynamic> json) {
		userSubscriptionId = json['UserSubscriptionId'];
		subscriptionId = json['SubscriptionId'];
		subscriptionName = json['SubscriptionName'];
		userId = json['UserId'];
		active = json['Active'];
		startDate = json['StartDate'];
		endDate = json['EndDate'];
	

	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['UserSubscriptionId'] = userSubscriptionId;
		data['SubscriptionId'] = subscriptionId;
		data['SubscriptionName'] = subscriptionName;
		data['UserId'] = userId;
		data['Active'] = active;
		data['StartDate'] = startDate;
		data['EndDate'] = endDate;
	

		return data;
	}
}
