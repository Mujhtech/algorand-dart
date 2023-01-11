import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'algod_block_service.g.dart';

@RestApi()
abstract class AlgodBlockService {
  factory AlgodBlockService(Dio dio, {String baseUrl}) = _AlgodBlockService;

  @GET('/v2/blocks/{round}')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getBlockByRound({
    @Path('round') required int round,
    @Query('format') String format = 'msgpack',
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });
}
