"use client";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  DropdownMenuTrigger,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuItem,
  DropdownMenuContent,
  DropdownMenu,
} from "@/components/ui/dropdown-menu";
import {
  TableHead,
  TableRow,
  TableHeader,
  TableCell,
  TableBody,
  Table,
} from "@/components/ui/table";
import { useEffect, useState } from "react";
import AppDialog from "@/components/component/appDialog";
import ServiceDialog from "@/components/component/serviceDialog";
import { tree } from "next/dist/build/templates/app-page";
import { stat } from "fs";

var Things: any[] = [];
var Services: any[] = [];
var Relationships: any[] = [];
var atlasApps: any[] = [];

export function dashboard() {
  const [things, setThings] = useState([]);
  const [services, setServices] = useState([]);
  const [relationships, setRelationships] = useState([]);
  const [atlasapps, setatlasApps] = useState([]);
  const [activate, setActivate] = useState(false);
  const [isOpen, setIsOpen] = useState(false);
  const [serviceDialog, setServiceDialog] = useState(false);

  function addThing(
    id: string,
    owner: string,
    name: string,
    description: string
  ) {
    if (id === "" || owner === "" || name === "" || description === "") {
      return;
    }
    if (Things.some((thing) => thing.id === id)) {
      return;
    }

    Things.push({ id: id, owner: owner, name: name, description: description });
  }
  function addService(
    name: string,
    category: string,
    type: string,
    description: string
  ) {
    if (name === "" || category === "" || type === "" || description === "") {
      return;
    }
    if (Services.some((service) => service.name === name)) {
      return;
    }
    Services.push({
      name: name,
      category: category,
      type: type,
      description: description,
    });
  }
  function addRelationship(
    name: string,
    type: string,
    description: string,
    firstService: string,
    secondService: string
  ) {
    if (name === "" || firstService === "" || secondService === "") {
      return;
    }
    if (Relationships.some((relationship) => relationship.name === name)) {
      return;
    }
    Relationships.push({
      name: name,
      type: type,
      description: description,
      firstService: firstService,
      secondService: secondService,
    });
  }
  function addApp(name: string, services: string, relationships: string) {
    if (name === "" || services === "" || relationships === "") {
      return;
    }
    if (atlasApps.some((app) => app.name === name)) {
      return;
    }
    atlasApps.push({
      name: name,
      services: services,
      relationships: relationships,
    });
  }

  async function getAtlasRelationship() {
    await fetch("http://127.0.0.1:5000/atlas/getRelationship", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        let thing = data[0];
        addRelationship(
          thing["Name"],
          thing["Type"],
          thing["Description"],
          thing["FS name"],
          thing["SS name"]
        );
        setRelationships(Relationships);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
  async function getAtlasThing() {
    await fetch("http://127.0.0.1:5000/atlas/getIdentity_Thing", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        let thing = data[0];
        let thing2 = data[1];
        addThing(
          thing["Thing ID"],
          thing["Owner"],
          thing["Name"],
          thing["Description"]
        );
        addThing(
          thing2["Thing ID"],
          thing2["Owner"],
          thing2["Name"],
          thing2["Description"]
        );
        setThings(Things);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
  async function getAtlasServices() {
    await fetch("http://127.0.0.1:5000/atlas/getService", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        let thing = data[0];
        let thing2 = data[1];
        addService(
          thing["Name"],
          thing["AppCategory"],
          thing["Type"],
          thing["Description"]
        );
        addService(
          thing2["Name"],
          thing2["AppCategory"],
          thing2["Type"],
          thing2["Description"]
        );
        setServices(Services);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
  async function getAtlasApps() {
    await fetch("http://127.0.0.1:5000/atlas/updateApp", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        let thing = data[data.length - 1];
        addApp(thing["name"], thing["services"], thing["relationships"]);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  async function deleteAtlasApp() {
    let name = atlasApps[atlasApps.length - 1].name;
    await fetch("http://127.0.0.1:5000/atlas/updateApp", {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ appName: name }),
    })
      .then((response) => response.json())
      .then((data) => {
        atlasApps = atlasApps.filter((app) => app.name !== name);
        setatlasApps(atlasApps);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
  useEffect(() => {
    getAtlasApps();
  }, []);
  useEffect(() => {
    getAtlasRelationship();
  }, []);
  useEffect(() => {
    getAtlasThing();
  }, []);
  useEffect(() => {
    getAtlasServices();
  }, []);

  async function setStatus(status: boolean) {
    await fetch("http://127.0.0.1:5000/garbotron/status", {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ status: status }),
    })
      .then((response) => response.json())
      .then((data) => {})
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  const openService = () => {
    // Call both functions when the button is clicked
    changeService();
    if (service === "Start Service") {
      setServiceDialog(true);
    } else {
      setServiceDialog(false);
    }
  };

  const [service, setService] = useState("Start Service");
  const changeService = () => {
    if (service === "Start Service") {
      setService("Stop Service");
      setStatus(true);
    } else {
      setService("Start Service");
      setStatus(false);
    }
  };

  return (
    <div className="grid min-h-screen w-full lg:grid-cols-[280px_1fr]">
      <div className="hidden border-r bg-gray-100/40 lg:block dark:bg-gray-800/40">
        <div className="flex h-full max-h-screen flex-col gap-2">
          <div className="flex h-[60px] items-center border-b px-6">
            <Link className="flex items-center gap-2 font-semibold" href="#">
              <CoomesIcon className="h-6 w-6" />
              <span className="">Coomes Industries</span>
            </Link>
          </div>
          <div className="flex-1 overflow-auto py-2">
            <nav className="grid items-start px-4 text-sm font-medium">
              <Link
                className="flex items-center gap-3 rounded-lg px-3 py-2 text-gray-500 transition-all hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-50"
                href="#"
              >
                <UsersIcon className="h-4 w-4" />
                Things
              </Link>
              <Link
                className="flex items-center gap-3 rounded-lg px-3 py-2 text-gray-500 transition-all hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-50"
                href="#"
              >
                <UsersIcon className="h-4 w-4" />
                Services
              </Link>
              <Link
                className="flex items-center gap-3 rounded-lg px-3 py-2 text-gray-500 transition-all hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-50"
                href="#"
              >
                <UsersIcon className="h-4 w-4" />
                Relationships
              </Link>
              <Link
                className="flex items-center gap-3 rounded-lg px-3 py-2 text-gray-500 transition-all hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-50"
                href="#"
              >
                <UsersIcon className="h-4 w-4" />
                Apps
              </Link>
            </nav>
          </div>
        </div>
      </div>
      <div className="flex flex-col">
        <main className="flex flex-1 flex-col gap-4 p-4 md:gap-8 md:p-6">
          <div className="flex items-center">
            <h1 className="font-semibold text-lg md:text-2xl">Things</h1>
          </div>
          <div className="border shadow-sm rounded-lg">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>ID</TableHead>
                  <TableHead>Owner</TableHead>
                  <TableHead>Name</TableHead>
                  <TableHead>Description</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {Things.map((thing) => (
                  <TableRow key={thing.id}>
                    <TableCell>{thing.id}</TableCell>
                    <TableCell>{thing.owner}</TableCell>
                    <TableCell>{thing.name}</TableCell>
                    <TableCell>{thing.description}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
          <div className="flex items-center">
            <h1 className="font-semibold text-lg md:text-2xl">Services</h1>
            <Button onClick={openService} className="ml-auto" size="sm">
              {service}
            </Button>
            <ServiceDialog open={serviceDialog} setOpen={setServiceDialog} />
          </div>
          <div className="border shadow-sm rounded-lg">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Name</TableHead>
                  <TableHead>Category</TableHead>
                  <TableHead>Type</TableHead>
                  <TableHead>Description</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {Object.keys(Services).map((service) => (
                  <TableRow key={service}>
                    <TableCell>{Services[service].name}</TableCell>
                    <TableCell>{Services[service].category}</TableCell>
                    <TableCell>{Services[service].type}</TableCell>
                    <TableCell>{Services[service].description}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
          <div className="flex items-center">
            <h1 className="font-semibold text-lg md:text-2xl">Relationships</h1>
          </div>
          <div className="border shadow-sm rounded-lg">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Name</TableHead>
                  <TableHead>Type</TableHead>
                  <TableHead>Description</TableHead>
                  <TableHead>First Service</TableHead>
                  <TableHead>Second Service</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {Object.keys(Relationships).map((relationship) => (
                  <TableRow key={relationship}>
                    <TableCell>{Relationships[relationship].name}</TableCell>
                    <TableCell>{Relationships[relationship].type}</TableCell>
                    <TableCell>
                      {Relationships[relationship].description}
                    </TableCell>
                    <TableCell>
                      {Relationships[relationship].firstService}
                    </TableCell>
                    <TableCell>
                      {Relationships[relationship].secondService}
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
          <div className="flex items-center">
            <h1 className="font-semibold text-lg md:text-2xl">Apps</h1>
            <Button
              onClick={() => setIsOpen(true)}
              className="ml-auto"
              size="sm"
            >
              Upload app
            </Button>
            <AppDialog open={isOpen} setOpen={setIsOpen} />
          </div>
          <div className="border shadow-sm rounded-lg">
            {Object.keys(atlasApps).length > 0 && (
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Name</TableHead>
                    <TableHead>Options</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {Object.keys(atlasApps).map((app) => (
                    <TableRow key={app}>
                      <TableCell>{atlasApps[app].name}</TableCell>
                      <TableCell>
                        <Button size="sm">SAVE APP</Button>
                      </TableCell>
                      <TableCell>
                        <Button size="sm">UPLOAD APP</Button>
                      </TableCell>
                      <TableCell>
                        <Button
                          size="sm"
                          disabled={activate}
                          onClick={() => setActivate(true)}
                        >
                          ACTIVATE
                        </Button>
                      </TableCell>
                      <TableCell>
                        <Button
                          size="sm"
                          disabled={!activate}
                          onClick={() => setActivate(false)}
                        >
                          STOP
                        </Button>
                      </TableCell>
                      <TableCell>
                        <Button onClick={() => deleteAtlasApp()} size="sm">
                          DELETE
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            )}
          </div>
        </main>
      </div>
    </div>
  );
}

function MoreHorizontalIcon(props: any) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <circle cx="12" cy="12" r="1" />
      <circle cx="19" cy="12" r="1" />
      <circle cx="5" cy="12" r="1" />
    </svg>
  );
}

function CoomesIcon(props: any) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M4.97 18H13v-1.5a2.5 2.5 0 0 0-2.5-2.5h-1a.5.5 0 0 1 0-1h1a3.5 3.5 0 0 1 3.5 3.5V18h.25c.472 0 .9-.191 1.21-.5h.04v-.041a1.7 1.7 0 0 0 .465-1.175v-7.61c1.61-.064 2.573-1.85 1.713-3.238l-.502-.81a2.12 2.12 0 0 0-1.802-1.004h-1.435v-.636A.986.986 0 0 0 12.953 2a2.445 2.445 0 0 0-2.444 2.446v3.456c-1.278.126-2.243.73-2.952 1.582c-.44.528-.779 1.148-1.04 1.798c-.227.46-.386.959-.464 1.485l-.013.059c-.276 1.182-.373 2.358-.403 3.232c-.012.374-.012.696-.008.942H4.97a1.971 1.971 0 0 1-1.44-3.317l.92-.987a3.59 3.59 0 0 0-.086-4.984l-.903-.903a.5.5 0 1 0-.707.707l.903.903a2.587 2.587 0 0 1 .062 3.595l-.92.987A2.973 2.973 0 0 0 4.97 18" />
    </svg>
  );
}

function UsersIcon(props: any) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
      <circle cx="9" cy="7" r="4" />
      <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
      <path d="M16 3.13a4 4 0 0 1 0 7.75" />
    </svg>
  );
}

export default dashboard;
