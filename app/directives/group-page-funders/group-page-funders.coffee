null

### @ngInject ###
global.cobudgetApp.directive 'groupPageFunders', () ->
    restrict: 'E'
    template: require('./group-page-funders.html')
    replace: true
    controller: (Dialog, $scope, $window) ->

      $scope.toggleMemberAdmin = (membership) ->
        membership.isAdmin = !membership.isAdmin
        membership.save()

      $scope.deleteMembership = (membership) ->
        Dialog.custom
          template: require('./delete-membership-dialog.tmpl.html')
          scope: $scope
          controller: ($scope, $mdDialog, Records) ->
            $scope.member = membership.member()
            $scope.warnings = [
              "All of their funds will be deleted from currently funding buckets",
              "All of their funds will be removed from the group",
              "All of their ideas will be deleted from the group",
              "All of their funding buckets will be deleted from the group and money will be refunded"
            ]
            $scope.cancel = ->
              $mdDialog.cancel()
            $scope.proceed = ->
              membership.destroy().then ->
                $mdDialog.hide()
                Dialog.alert(title: 'Success!', content: 'Member deleted.').then ->
                  $window.location.reload()

      return