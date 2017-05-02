using ClientServerLib;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Client {
    class ClientData {
        public IUser Login(string username, string password_hash) {
            SocketConnection client = new SocketConnection("127.0.0.1", 1234);
            client.Connect();

            client.SendText("Login");

            int _ds = client.GetDataSize();

            client.GetDataType();

            IUser user = (IUser)client.ReceiveObject(_ds);

            return user;
        }
    }
}
