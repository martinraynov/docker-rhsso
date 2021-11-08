var groups = []; 

user.getGroups().forEach(function(groupModel) {
    var groupName = groupModel.getName();  
    var groupAttributes = groupModel.getAttributes(); 

    groups[groupName] = groupAttributes; 
}); 

exports = groups; 

//token.setOtherClaims(token.getClaimName(), groups); 