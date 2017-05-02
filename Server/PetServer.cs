using ClientServerLib;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Database;

namespace Server {
    class PetServer {
        public void Handler(SocketConnection connection) {
            bool isRunning = true;
            while (isRunning) {
                int ds = connection.GetDataSize();
                Console.WriteLine($"Data size: {ds}");
                byte dt = connection.GetDataType();
                Console.WriteLine($"Data type: {dt} {0x54}");

                switch (dt) {
                    // Object
                    case 0x4F:
                        break;
                    // Text
                    case 0x54:
                        HandleRequest(connection, connection.ReceiveText(ds));
                        break;
                    default:
                        break;
                }
            }
        }

        public void HandleRequest(SocketConnection connection, string request) {
            switch (request) {
                case "GetAllInformers":
                    connection.SendObject(InformerWrapper.GetAllInformers());
                    break;
                case "SaveInformer":
                    int _ds =connection.GetDataSize();
                    InformerWrapper.SaveInformer((Informer)connection.ReceiveObject(_ds));
                    break;
                default:
                    break;
            }
        }

    }
}
