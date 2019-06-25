﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.17929
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.17929.
// 
#pragma warning disable 1591

namespace DCCMSNameSpace.net.digitalchains.cntry {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="IpCountryServiceSoap", Namespace="cntry.digitalchains.net")]
    public partial class IpCountryService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback GetIpInfoOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetUrlInfoOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public IpCountryService() {
            this.Url = global::DCCMSNameSpace.Properties.Settings.Default.DCCMSNameSpace_net_digitalchains_cntry_IpCountryService;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event GetIpInfoCompletedEventHandler GetIpInfoCompleted;
        
        /// <remarks/>
        public event GetUrlInfoCompletedEventHandler GetUrlInfoCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("cntry.digitalchains.net/GetIpInfo", RequestNamespace="cntry.digitalchains.net", ResponseNamespace="cntry.digitalchains.net", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public IpEntity GetIpInfo(string ip, string Key) {
            object[] results = this.Invoke("GetIpInfo", new object[] {
                        ip,
                        Key});
            return ((IpEntity)(results[0]));
        }
        
        /// <remarks/>
        public void GetIpInfoAsync(string ip, string Key) {
            this.GetIpInfoAsync(ip, Key, null);
        }
        
        /// <remarks/>
        public void GetIpInfoAsync(string ip, string Key, object userState) {
            if ((this.GetIpInfoOperationCompleted == null)) {
                this.GetIpInfoOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetIpInfoOperationCompleted);
            }
            this.InvokeAsync("GetIpInfo", new object[] {
                        ip,
                        Key}, this.GetIpInfoOperationCompleted, userState);
        }
        
        private void OnGetIpInfoOperationCompleted(object arg) {
            if ((this.GetIpInfoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetIpInfoCompleted(this, new GetIpInfoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("cntry.digitalchains.net/GetUrlInfo", RequestNamespace="cntry.digitalchains.net", ResponseNamespace="cntry.digitalchains.net", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetUrlInfo(string url, string Key) {
            object[] results = this.Invoke("GetUrlInfo", new object[] {
                        url,
                        Key});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetUrlInfoAsync(string url, string Key) {
            this.GetUrlInfoAsync(url, Key, null);
        }
        
        /// <remarks/>
        public void GetUrlInfoAsync(string url, string Key, object userState) {
            if ((this.GetUrlInfoOperationCompleted == null)) {
                this.GetUrlInfoOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetUrlInfoOperationCompleted);
            }
            this.InvokeAsync("GetUrlInfo", new object[] {
                        url,
                        Key}, this.GetUrlInfoOperationCompleted, userState);
        }
        
        private void OnGetUrlInfoOperationCompleted(object arg) {
            if ((this.GetUrlInfoCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetUrlInfoCompleted(this, new GetUrlInfoCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.17929")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="cntry.digitalchains.net")]
    public partial class IpEntity {
        
        private string ipAddressField;
        
        private double startSegmentField;
        
        private double endSegmentField;
        
        private string rEGISTRYField;
        
        private string aSSIGNEDField;
        
        private string cTRYField;
        
        private string cNTRYField;
        
        private string cOUNTRYField;
        
        private string cOUNTRY_ARField;
        
        private string flagField;
        
        private string urlInfoField;
        
        /// <remarks/>
        public string IpAddress {
            get {
                return this.ipAddressField;
            }
            set {
                this.ipAddressField = value;
            }
        }
        
        /// <remarks/>
        public double StartSegment {
            get {
                return this.startSegmentField;
            }
            set {
                this.startSegmentField = value;
            }
        }
        
        /// <remarks/>
        public double EndSegment {
            get {
                return this.endSegmentField;
            }
            set {
                this.endSegmentField = value;
            }
        }
        
        /// <remarks/>
        public string REGISTRY {
            get {
                return this.rEGISTRYField;
            }
            set {
                this.rEGISTRYField = value;
            }
        }
        
        /// <remarks/>
        public string ASSIGNED {
            get {
                return this.aSSIGNEDField;
            }
            set {
                this.aSSIGNEDField = value;
            }
        }
        
        /// <remarks/>
        public string CTRY {
            get {
                return this.cTRYField;
            }
            set {
                this.cTRYField = value;
            }
        }
        
        /// <remarks/>
        public string CNTRY {
            get {
                return this.cNTRYField;
            }
            set {
                this.cNTRYField = value;
            }
        }
        
        /// <remarks/>
        public string COUNTRY {
            get {
                return this.cOUNTRYField;
            }
            set {
                this.cOUNTRYField = value;
            }
        }
        
        /// <remarks/>
        public string COUNTRY_AR {
            get {
                return this.cOUNTRY_ARField;
            }
            set {
                this.cOUNTRY_ARField = value;
            }
        }
        
        /// <remarks/>
        public string Flag {
            get {
                return this.flagField;
            }
            set {
                this.flagField = value;
            }
        }
        
        /// <remarks/>
        public string UrlInfo {
            get {
                return this.urlInfoField;
            }
            set {
                this.urlInfoField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    public delegate void GetIpInfoCompletedEventHandler(object sender, GetIpInfoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetIpInfoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetIpInfoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public IpEntity Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((IpEntity)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    public delegate void GetUrlInfoCompletedEventHandler(object sender, GetUrlInfoCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetUrlInfoCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetUrlInfoCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591