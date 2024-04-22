"use client";
import React, { use, useEffect } from "react";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
  DialogFooter,
} from "@/components/ui/dialog";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { set, useForm } from "react-hook-form";

const AppDialog = ({ open, setOpen }: { open: any; setOpen: any }) => {
  const appSchema = z.object({
    appName: z.string(),
    services: z.string(),
    relationships: z.string(),
  });

  const form = useForm<z.infer<typeof appSchema>>({
    resolver: zodResolver(appSchema),
    defaultValues: {
      appName: "",
      services: "",
      relationships: "",
    },
  });

  const onSubmit = async (obj) => {
    const response = await fetch("http://127.0.0.1:5000/atlas/updateApp", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: JSON.stringify(obj),
    });
    if (response.ok) {
      console.log("App created successfully");
      setOpen(false);
      form.reset();
      window.location.reload();
    }
  };

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent className="sm:max-w-[500px]">
        <DialogHeader>
          <DialogTitle>App Editor</DialogTitle>
          <DialogDescription>Upload or start a new app</DialogDescription>
        </DialogHeader>
        <Tabs defaultValue="newapp" className="w-[400px]">
          <TabsList>
            <TabsTrigger value="newapp">Start a new App</TabsTrigger>
            <TabsTrigger value="uploadapp">Upload an app</TabsTrigger>
          </TabsList>
          <TabsContent value="newapp">
            Create a new app here.
            <Form {...form}>
              <form
                onSubmit={form.handleSubmit(onSubmit, (e) => console.log(e))}
              >
                <FormItem>
                  <FormField
                    name="appName"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel>App Name</FormLabel>
                        <FormControl>
                          <Input {...field} />
                        </FormControl>
                        <FormDescription>The name of the app</FormDescription>
                      </FormItem>
                    )}
                  />
                </FormItem>
                <FormItem>
                  <FormField
                    name="services"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel>Services</FormLabel>
                        <FormControl>
                          <Input {...field} />
                        </FormControl>
                        <FormDescription>
                          The services in the app seperated by commas (,)
                        </FormDescription>
                      </FormItem>
                    )}
                  />
                </FormItem>
                <FormItem>
                  <FormField
                    name="relationships"
                    render={({ field }) => (
                      <FormItem>
                        <FormLabel>Relationships</FormLabel>
                        <FormControl>
                          <Input {...field} />
                        </FormControl>
                        <FormDescription>
                          The relationships between services seperated by commas
                          (,)
                        </FormDescription>
                      </FormItem>
                    )}
                  />
                </FormItem>
                <DialogFooter>
                  <Button type="submit">Save App</Button>
                </DialogFooter>
              </form>
            </Form>
          </TabsContent>
          <TabsContent value="uploadapp">
            Upload an app here as an .iot file
            <Input type="file" />
            <DialogFooter>
              <Button onClick={onSubmit}>Save App</Button>
            </DialogFooter>
          </TabsContent>
        </Tabs>
      </DialogContent>
    </Dialog>
  );
};

export default AppDialog;
