﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool
//     Changes to this file will be lost if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities {
    public class Informer : Person, IUser {
        public virtual string Currency
        {
            get;
            set;
        }

        public virtual string PaymentType
        {
            get;
            set;
        }

        public virtual string Tags
        {
            get;
            set;
        }

        public string Token
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public string Username
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }
    }


}