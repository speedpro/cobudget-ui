angular
  .module('cobudget', ['ngRoute', 'restangular'])
  .constant('config', window.Cobudget.Config.Constants)
  .config(window.Cobudget.Config.Router)
  .config(window.Cobudget.Config.Restangular)
  .directive('bucketList', window.Cobudget.Directives.BucketList)
  .directive('bucketSummary', window.Cobudget.Directives.BucketSummary)
  .directive('budgetBanner', window.Cobudget.Directives.BudgetBanner)
  .directive('navBar', window.Cobudget.Directives.NavBar)
  .directive('tabBar', window.Cobudget.Directives.TabBar)
  .service('Budget', window.Cobudget.Resources.Budget)
  .service('Bucket', window.Cobudget.Resources.Bucket)
  .service('BudgetLoader', window.Cobudget.Services.BudgetLoader)
