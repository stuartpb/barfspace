# canvathing data model

## Overall principles

All documents here are patterned after the CouchDB baseline: primarily indexed and referenced with UUIDs, designed for replication.

## Volunteer

Volunteer records are the data structure for users of the app: they reference a Contact

## Campaign

A Campaign represents the authoritative coordinating body for a canvassing operation - a subject, a methodology, a script.

New Campaigns may use visit data from previous or parallel Campaigns, but they need to distinguish that the visit data *came from a different campaign*. Even when there's a high likelihood of correlation, just because someone was enthusiastic about, say, Medicare for All, doesn't necessarily mean they're going to like Bernie Sanders (and vice versa), and it'd throw off your data to treat them as one campaign.

## Turf

A Turf is a section of map that the coordinator of a Campaign / Expeditions has prepared and separated out for their volunteer base.

The basic structure of a Turf is just an arbitrary Geo polygon.

## Expedition

An Expedition is one day of canvassing for a Campaign, within one turf.

Expeditions are separated out by whatever Volunteer is gathering the data: they may consist of multiple Volunteers (eg. a band of two or more canvassers knocking on the same doors together), but there must be one Volunteer ultimately responsible for the data entered.

Changes to an Expedition's volunteer membership are reflected by a record of changes to the Expedition: a member may

Essentially, two expeditions with very similar membership and one Expedition with

## Residence

A Residence is an address, with geolocation data.

A Residence also includes any notes that might help to locate or otherwise visit the residence beyond its geo data, like "door is green and halfway up the steps", or "do not be afraid of the dog, it is a hologram".

A Residence record must have a property stating where its geolocation data was sourced from: ie. if it was manually entered by a volunteer, or if it was populated from a geocoding database (and, if so, what geocoder was used).

A Residence does *not* include data on its residents: this information is compiled as a derived structure based on previous Visits.

## Complex

A Complex is an encapsulating structure of compound Residences, like an apartment building.

## Contact

A Contact is a pretty classic vCard structure

A contact can have as little as a first name and geo position

A contact may be associated to a Residence by Visits (which would likely show the visited Contacts having the same mailing address), but has no intrinsic association to any Residence. This is crucial: just because somebody *lives* at a place doesn't mean they *want to get their mail* at that place. Lots of folks in unstable circumstances would rather you send their mail to a PO Box, for instance, since they're not sure where they're going to be living month-to-month.

## Visit

A Visit is a record of an encounter at a Residence

If a visit went well, it will bring an association to a Contact, which may or may not be the previous contact that was at the Residence.

### Remarks on future extension

If this database were extended out to phonebanking, a Call would look a lot like a Visit, except only involving a Contact.

## Canvassee

A Canvassee is a synthetic data structure derived from all the previous Visits for a Residence that had the same Contact (if any).
