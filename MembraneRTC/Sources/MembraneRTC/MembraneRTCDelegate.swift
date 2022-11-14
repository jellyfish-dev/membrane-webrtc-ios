/// Delegate responsible for receiving notification from `MembraneRTC` client.
public protocol MembraneRTCDelegate {
    /// Callback invoked when client has successfully connected via transport layer.
    func onConnected()

    /// Callback invoked when the client has been approved to participate in session.
    func onJoinSuccess(peerID: String, peersInRoom: [Peer])

    /// Callback invoked when client has been denied access to enter the room.
    func onJoinError(metadata: Any)

    /// Callback invoked a track is ready to be played.
    func onTrackReady(ctx: TrackContext)

    /// Callback invoked a peer already present in a room adds a new track.
    func onTrackAdded(ctx: TrackContext)

    /// Callback invoked when a track will no longer receive any data and should get removed.
    func onTrackRemoved(ctx: TrackContext)

    /// Callback invoked when track's metadata gets updated.
    func onTrackUpdated(ctx: TrackContext)

    /// Callback invoked when a new peer joins the room.
    func onPeerJoined(peer: Peer)

    /// Callback invoked when a peer leaves the room.
    ///
    /// When a peer with active track leaves the room, `onTrackRemoved` will be called for all their tracks beforehand.
    func onPeerLeft(peer: Peer)

    /// Callback invoked when peer's metadata gets updated.
    func onPeerUpdated(peer: Peer)

    /// Callback invoked every time a local peer is removed by the server
    func onRemoved(reason: String)

    /// Callback invoked when received track encoding has changed
    func onTrackEncodingChanged(peerId: String, trackId: String, encoding: String)

    /// Callback invoked when an errors happens.
    ///
    /// For more information about the error type please refere to `MembraneRTCError`.
    func onError(_ error: MembraneRTCError)
}

extension MembraneRTCDelegate {
    public func onTrackEncodingChanged(peerId: String, trackId: String, encoding: String) {
        sdkLogger.info("Track encoding changed \(trackId) -> \(encoding)")
    }

    public func onRemoved(reason: String) {
        sdkLogger.error("Peer removed, reason: \(reason)")
    }
}
