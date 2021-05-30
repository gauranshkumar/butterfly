import 'package:butterfly/config/colors.dart';
import 'package:butterfly/models/doctors_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SessionScreen extends StatefulWidget {
  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final doctorsDetails = doctorsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 4),
              child: Text(
                "Consult a doctor",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: BrandColors.blue,
                    fontFamily: 'BrandIcons',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: BrandColors.grey,
          ),
          Flexible(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: doctorsDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            radius: 60,
                            backgroundColor: BrandColors.white,
                            child: Image.asset(doctorsDetails[index].iconPath),
                          ),
                          title: Transform.translate(
                            offset: Offset(-16, 0),
                            child: Text(
                              doctorsDetails[index].name,
                              style: TextStyle(
                                fontFamily: "BrandIcons",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Transform.translate(
                            offset: Offset(-16, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: Text(
                                    doctorsDetails[index].role,
                                    style: TextStyle(
                                      color: BrandColors.black,
                                      fontFamily: "BrandIcons",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                  child: Text(
                                    doctorsDetails[index].experience,
                                    style: TextStyle(
                                      color: BrandColors.black,
                                      fontFamily: "BrandIcons",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 115,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        color: BrandColors.green,
                                      ),
                                      Text(
                                        "${doctorsDetails[index].rating}%",
                                        style: TextStyle(
                                          color: BrandColors.black,
                                          fontFamily: "BrandIcons",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: BrandColors.green,
                                      ),
                                      Text(
                                        doctorsDetails[index].location,
                                        style: TextStyle(
                                          color: BrandColors.black,
                                          fontFamily: "BrandIcons",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: doctorsDetails[index].isVerified
                              ? Transform.translate(
                                  offset: Offset(-16, -8),
                                  child: Icon(
                                    Icons.verified,
                                    color: BrandColors.verifiedBlue,
                                  ),
                                )
                              : Transform.translate(
                                  offset: Offset(-16, -8),
                                  child: Icon(
                                    Icons.verified,
                                    color: BrandColors.white,
                                  ),
                                ),
                          isThreeLine: true,
                        ),
                        const Divider(thickness: 2, color: BrandColors.grey),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Availability",
                                    style: TextStyle(
                                      color: BrandColors.blue,
                                      fontFamily: 'BrandIcons',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.video_call_outlined,
                                        color: BrandColors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          doctorsDetails[index].timing,
                                          style: TextStyle(
                                            color: BrandColors.blue,
                                            fontFamily: 'BrandIcons',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.people_alt_outlined,
                                        color: BrandColors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${doctorsDetails[index].patientsCount} patients treated",
                                          style: TextStyle(
                                            color: BrandColors.blue,
                                            fontFamily: 'BrandIcons',
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () => {
                                  //TODO: Book Video Call Button
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: BrandColors.blue,
                                  ),
                                  height: 56,
                                  width: 203,
                                  child: Text(
                                    "Book Video Call",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: BrandColors.white,
                                      fontFamily: 'BrandIcons',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(thickness: 2, color: BrandColors.grey),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
