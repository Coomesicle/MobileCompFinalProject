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

const ServiceDialog = ({ open, setOpen }: { open: any; setOpen: any }) => {
  const serviceSchema = z.object({
    maxDistance: z.string().regex(new RegExp(/^\d*\.?\d+$/)),
    refreshRate: z.string().regex(new RegExp(/^\d*\.?\d+$/)),
  });

  const form = useForm<z.infer<typeof serviceSchema>>({
    resolver: zodResolver(serviceSchema),
    defaultValues: {
      maxDistance: "",
      refreshRate: ""
    },
  });

  const onSubmit = async (obj: any) => {
    const response = await fetch(
      "http://127.0.0.1:5000/garbotron/data",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: JSON.stringify(obj),
      }
    );
    if (response.ok) {
      setOpen(false);
      form.reset();
    }

  };

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogContent className="sm:max-w-[500px]">
        <DialogHeader>
          <DialogTitle>Service Starter</DialogTitle>
          <DialogDescription>Set Variables for the Service</DialogDescription>
        </DialogHeader>
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit, (e) => console.log(e))}>
            <FormItem>
              <FormField
                name="maxDistance"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Max Distance</FormLabel>
                    <FormControl>
                      <Input {...field} />
                    </FormControl>
                    <FormDescription>
                      Max Distance (cm) of the actuator from the Sensor
                    </FormDescription>
                  </FormItem>
                )}
              />
            </FormItem>
            <FormItem>
              <FormField
                name="refreshRate"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Refresh Rate</FormLabel>
                    <FormControl>
                      <Input {...field} />
                    </FormControl>
                    <FormDescription>
                      Sets the refresh rate (per min) of the device
                    </FormDescription>
                  </FormItem>
                )}
              />
            </FormItem>
          </form>
        </Form>
        <DialogFooter>
          <Button onClick={form.handleSubmit(onSubmit)}>Submit</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
};

export default ServiceDialog;
