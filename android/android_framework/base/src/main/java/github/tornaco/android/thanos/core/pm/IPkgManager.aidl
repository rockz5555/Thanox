package github.tornaco.android.thanos.core.pm;

import github.tornaco.android.thanos.core.pm.IAddPluginCallback;
import github.tornaco.android.thanos.core.pm.IPackageSetChangeListener;
import github.tornaco.android.thanos.core.pm.ComponentInfo;
import github.tornaco.android.thanos.core.IPrinter;

interface IPkgManager {
    String[] getPkgNameForUid(int uid);
    int getUidForPkgName(String pkgName);

    // ApplicationInfo
    List<AppInfo> getInstalledPkgs(int flags);
    AppInfo getAppInfo(String pkgName);

    String[] getWhiteListPkgs();
    boolean isPkgInWhiteList(String pkg);

    void setComponentEnabledSetting(in ComponentName componentName, int newState, int flags);
    int getComponentEnabledSetting(in ComponentName componentName);
    boolean isComponentDisabledByThanox(in ComponentName componentName);

    boolean getApplicationEnableState(String packageName);
    void setApplicationEnableState(String packageName, boolean enable, boolean tmp);

    List<ComponentInfo> getActivities(String packageName);
    int getActivitiesCount(String packageName);
    List<ComponentInfo> getActivitiesInBatch(String packageName, int itemCountInEachBatch, int batchIndex);

    List<ComponentInfo> getReceivers(String packageName);
    int getReceiverCount(String packageName);
    List<ComponentInfo> getReceiversInBatch(String packageName, int itemCountInEachBatch, int batchIndex);

    List<ComponentInfo> getServices(String packageName);
    int getServiceCount(String packageName);
    List<ComponentInfo> getServicesInBatch(String packageName, int itemCountInEachBatch, int batchIndex);

    void setSmartFreezeEnabled(boolean enable);
    boolean isSmartFreezeEnabled();
    void setPkgSmartFreezeEnabled(String pkgName, boolean enable);
    boolean isPkgSmartFreezeEnabled(String pkgName);
    String[] getSmartFreezePkgs();
    void launchSmartFreezePkg(String pkgName);

    void setSmartFreezeScreenOffCheckEnabled(boolean enable);
    boolean isSmartFreezeScreenOffCheckEnabled();
    void setSmartFreezeScreenOffCheckDelay(long delay);
    long getSmartFreezeScreenOffCheckDelay();

    Intent queryLaunchIntentForPackage(String pkgName);

    String[] enableAllThanoxDisabledPackages(boolean removeFromSmartFreezeList);

    boolean deviceHasGms();
    boolean verifyBillingState();

    void launchSmartFreezePkgThenKillOrigin(String pkgName, String origin);

    boolean isProtectedWhitelistEnabled();
    void setProtectedWhitelistEnabled(boolean enable);

    oneway void addPlugin(in ParcelFileDescriptor pfd, String pluginPackageName,in IAddPluginCallback callback);
    void removePlugin(String pluginPackageName);
    boolean hasPlugin(String pluginPackageName);

    boolean isSmartFreezeHidePackageEventEnabled();
    void setSmartFreezeHidePackageEventEnabled(boolean enabled);

    void dump(in IPrinter p);

    void setPackageBlockUninstallEnabled(String pkgName, boolean enable);
    boolean isPackageBlockUninstallEnabled(String pkgName);

    void setPackageBlockClearDataEnabled(String pkgName, boolean enable);
    boolean isPackageBlockClearDataEnabled(String pkgName);

    int getInstalledPackagesCount(int appFlags);

    PackageSet createPackageSet(String label);
    boolean removePackageSet(String id);
    PackageSet getPackageSetById(String id, boolean withPackages);
    List<PackageSet> getAllPackageSets(boolean withPackages);
    List<String> getAllPackageSetIds();
    void addToPackageSet(String pkg, String id);
    void removeFromPackageSet(String pkg, String id);

    List<PackageSet> getPackageSetThatContainsPkg(String pkg);
    List<String> getPackageSetLabelsThatContainsPkg(String pkg);

    void setFreezePkgWithSuspendEnabled(boolean enable);
    boolean isFreezePkgWithSuspendEnabled();

    List<AppInfo> getInstalledPkgsByPackageSetId(String pkgSetId);

    void registerPackageSetChangeListener(in IPackageSetChangeListener listener);
    void unRegisterPackageSetChangeListener(in IPackageSetChangeListener listener);

    void setEnablePackageOnLaunchRequestEnabled(String pkg, boolean enable);
    boolean isEnablePackageOnLaunchRequestEnabled(String pkg);

    List<ComponentInfo> getProviders(String packageName);

    // Wrap api to skip permission check
    String[] getPackagesForUid(int uid);
}