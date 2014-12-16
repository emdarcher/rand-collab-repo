#!/usr/bin/env python

import xml.etree.ElementTree as xml
import sys
import httplib

#originally from https://gist.github.com/edma2/2404394
#then modified by github user emdarcher

#this script gets the latest bus top time predictions from nextbus.com
#use by doing `python my_nb.py <stopId>` where stopID is the 
#ID of your stop that is used by nextbus.com
#links to find your stop's ID # under your local agency
#can be found at the bottom of this page:
#       http://www.nextbus.com/wirelessConfig/sms.jsp
#for example, the ID number for SF MUNI 29 Sunset Line
# inbound at Lake Merced and Middlefield Dr. is 14838
# and outbound is 14839
#to use that ID just run this command:
# python my_nb.py 14838
#and then it should show the next 5 predictions.
#M-ocean-view eucalyptus and right-of way inbound is 16220

agency_id = 'sf-muni' #change this to have the correct agency ID

#describes the usage.
def usage():
    print 'usage: %s <stopId>' % sys.argv[0]
    exit(-1)

if len(sys.argv) != 2:
    usage()

stop_id = sys.argv[1] #gets the stop ID # from the command line argument

#the URL
url = '/service/publicXMLFeed?command=predictions&a='+ \
    agency_id +'&stopId=' + stop_id

nextbus = httplib.HTTPConnection('webservices.nextbus.com')
nextbus.request(method='GET', url=url)
response = nextbus.getresponse()

routes = xml.XML(response.read()).findall('predictions')
for route in routes:
    route_title = route.get('routeTitle')
    direction = route.find('direction')
    alive = direction is not None

    if alive:
        direction_title = direction.get('title')
        for prediction in direction.iter('prediction'):
            seconds = int(prediction.get('seconds'))
            minutes = seconds/60
            seconds = seconds%60
            print "(%d:%d left)" % (minutes, seconds), \
                route_title, '->', direction_title
    else:
        direction_title = route.get('dirTitleBecauseNoPredictions')
        print route_title, '->', direction_title


